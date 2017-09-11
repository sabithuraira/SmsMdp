<?php
    //koneksi ke mysql database
    mysql_connect("localhost","root","");
    mysql_select_db("gammu");

    //query untuk membaca SMS yang belum diproses
    $query = "SELECT * FROM inbox WHERE Processed = 'false'";
    $hasil = mysql_query($query);
    while($data= mysql_fetch_array($hasil)){

        //baca id sms
        $id = $data['ID'];

        //baca no pengirim
        $noPengirim = $data['SenderNumber'];
        //$noPengirim = '+628999826256';

        //baca pesan SMS dan ubah jadi kapital
        $msg = strtoupper($data['TextDecoded']);
        //$msg="SOUT 16 09 B0100165 B 10 9;16 09 B0100183 U 10 10";
        //proses parsing
        //pecah pesan berdasarkan karakter
        if(strlen($msg)<=160)
        {
            $first_val=substr($msg, 0,4);
            if($first_val=="SOUT")
            {
                //$phone_num=PhoneNumber::model()->findByAttributes(array('number'=>$noPengirim));
                $phone_exist="SELECT * FROM phone_number WHERE number='{$noPengirim}'";

                $hasil_check_phone=mysql_query($phone_exist);
                $total_row_phone=mysql_num_rows($hasil_check_phone);
                
                if($total_row_phone>0)
                {
                    ////////
                    $inti=substr($msg, 5);
                    $sub_inti=explode(";", $inti);

                    foreach ($sub_inti as $skey => $svalue)
                    {    
                        $pecah = explode(" ",$svalue);
                        if(count($pecah)==6)
                        {
                            //$wil=$pecah[1];
                            //if(strlen($pecah[1])==14)
                            //{
                            $prov               =$pecah[0];
                            $kab                =$pecah[1];
                            $nks                =$pecah[2]; 
                            $keterangan         =$pecah[3];
                            $total_sampel       =$pecah[4];
                            $total_realisasi    =$pecah[5];
                            
                            $sql_check="SELECT * FROM m_nks WHERE kode_prov='$prov' AND kode_kab='$kab' AND nks='$nks'";

                            $hasil_check=mysql_query($sql_check);
                            $total_row=mysql_num_rows($hasil_check);
                            
                            if($total_row>0)
                            {
                                $phone_wil="SELECT * FROM phone_wil WHERE kode_prov='$prov' AND kode_kab='$kab' AND 
                                    nks='$nks' AND number='{$noPengirim}'";

                                $hasil_check_wil=mysql_query($phone_wil);
                                $total_row_wil=mysql_num_rows($hasil_check_wil);

                                if($total_row_wil>0)
                                {
                                    $is_true=0;
                                    if($keterangan=='U')
                                    {
                                        $is_true=1;
                                    }
                                    else if($keterangan=='B')
                                    {
                                        $row = mysql_fetch_array($hasil_check);
                                        if(strlen($row['jml_realisasi'])>0)
                                        {
                                            $is_true=2;
                                        }
                                        else
                                        {
                                            $is_true=1;
                                        }
                                    }
                                    else
                                    {
                                        $is_true=3;
                                    }

                                    if($is_true==1)
                                    {
                                         $query_update = "UPDATE m_nks SET jml_sample='$total_sampel', 
                                                jml_realisasi='$total_realisasi' WHERE kode_prov='$prov' 
                                                AND kode_kab='$kab' AND nks='$nks'";
                                    
                                        if(mysql_query($query_update))
                                        {
                                            if($skey==0)
                                                $reply = "$prov $kab $nks berhasil diperbaharui";
                                            else
                                                $reply .= ";$prov $kab $nks berhasil diperbaharui";
                                            
                                        }
                                        else
                                        {
                                            if($skey==0)
                                                $reply = "$prov $kab $nks gagal disimpan, ulangi lagi"; 
                                            else
                                                $reply .= ";$prov $kab $nks anda gagal disimpan, ulangi lagi"; 
                                        }
                                    }
                                    else if($is_true==2)
                                    {
                                        if($skey==0)
                                            $reply="$prov $kab $nks sudah ada, gunakan format update U untuk memperbaharui data";
                                        else
                                            $reply.=";$prov $kab $nks sudah ada, gunakan format update U untuk memperbaharui data";
                                    }
                                    else
                                    {
                                        if($skey==0)
                                            $reply="Format $prov $kab $nks salah, ulangi lagi";
                                        else
                                            $reply.=";Format $prov $kab $nks salah, ulangi lagi";
                                        
                                    }
                                }
                                else
                                {
                                    if($skey==0)
                                        $reply="$prov $kab $nks bukan wewenang anda";
                                    else
                                        $reply.=";$prov $kab $nks bukan wewenang anda";   
                                }
                            }
                            else
                            {
                                if($skey==0)
                                    $reply = "$prov $kab $nks tidak ditemukan";
                                else
                                    $reply .= ";$prov $kab $nks tidak ditemukan";
                            }
                           
                                
                            /*
                            }
                            else
                            {
                                $reply = "Format wilayah anda salah, ulangi lagi";
                            }
                            */
                        }
                        else if(count($pecah)<6)
                        {
                            if($skey==0)
                                $reply = "SMS belum lengkap, ulangi lagi";
                            else
                                $reply .= ";SMS belum lengkap, ulangi lagi";
                            
                        }
                        else
                        {
                            if($skey==0)
                                $reply="Format salah, ulangi lagi";
                            else
                                $reply.=";Format salah, ulangi lagi";
                        }
                    }
                }
                else
                {
                    $reply = "Nomor tidak terdaftar";
                }
            }
            else
            {
                $reply="Format salah, ulangi lagi";
            }
        }
        else
        {
             $reply = "Pesan yang anda kirim melebihi 160 karakter, ulangi tanpa melebihi 160 karakter";   
        }

        //echo $reply;
        //if($noPengirim="08999826256" || $noPengirim="+628999826256")
        //{
            
            $query3 = "INSERT INTO outbox(DestinationNumber, TextDecoded, creatorID) VALUES('$noPengirim','$reply','Gammu')";
            mysql_query($query3);
            //ubah nilai ‘processed’ menjadi ‘true’ untuk setiap SMS
            //yang telah diproses
            $query3 = "UPDATE inbox SET Processed = 'true' WHERE ID = '$id'";
            mysql_query($query3);
            
        //}
    }
?>