<?php
    mysql_connect("localhost","root","");
    mysql_select_db("smsmdp");

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
        // $msg="ABSENSI 2 8990";
        //proses parsing
        //pecah pesan berdasarkan karakter
        if(strlen($msg)<=160)
        {
            $total_word=explode(" ", $msg);
            
            if(count($total_word)==2){
                if($total_word[0]=="IPK")
                {      
                    // $sql_check="SELECT * FROM m_nks WHERE kode_prov='$prov' AND kode_kab='$kab' AND nks='$nks'";
                    $sql_get_nilai="SELECT m.nim, mk.grade, g.grade_value, k.sks FROM mahasiswas m, mahasiswa_kelas mk, kelas k, grades g WHERE m.nim='".$total_word[1]."' AND mk.mahasiswa_id=m.id AND mk.kelas_id=k.id AND g.grade=mk.grade";

                    $hasil_check=mysql_query($sql_get_nilai);
                    $total_row=mysql_num_rows($hasil_check);

                    if($total_row>0)
                    {
                        $total_grade=0; $total_sks=0;
                        while ($row = mysql_fetch_assoc($hasil_check)) {
                            $total_grade+=($row['grade_value']*$row['sks']);
                            $total_sks+=$row['sks'];
                        }
                        // echo "GRADE:".$total_grade;
                        // echo "SKS:".$total_sks;
                        $ipk = $total_grade/$total_sks;
                        $reply="IPK ".$total_word[1]." : $ipk";
                    }
                    else{
                        $reply=$total_word[1]." tidak terdaftar atau belum mengikuti kuliah";
                    }
                }
            }
            else if(count($total_word)==3){
                if($total_word[0]="ABSENSI")
                {
                    //check if class exist
                    $sql_check_kelas="SELECT * FROM `kelas` WHERE id=".$total_word[1];

                    $hasil_check_kelas=mysql_query($sql_check_kelas);
                    $total_kelas=mysql_num_rows($hasil_check_kelas);

                    if($total_kelas>0)
                    {
                        //check if mahasiswa exist
                        //query the absensi
                        $sql_absen="SELECT mk.* FROM mahasiswa_kelas mk, mahasiswas m WHERE m.nim=".$total_word[2]." AND mk.mahasiswa_id=m.id AND mk.kelas_id=".$total_word[1];

                        $hasil_absen=mysql_query($sql_absen);
                        $total_absen=mysql_num_rows($hasil_absen);
                        if($total_absen>0){
                            $total_satu=0;
                            $total_pertemuan=0;
                            
                            $row = mysql_fetch_assoc($hasil_absen);

                            for($i=1;$i<=28;++$i){
                                if($row['abs'.$i]!=null){
                                    $total_pertemuan++;
                                    if($row['abs'.$i]==1){
                                        $total_satu++;
                                    }
                                }
                            }

                            $persen_absen=$total_satu/$total_pertemuan*100;

                            $reply="Persentase absensi ".$total_word[2]." ".$persen_absen." %";
                        }
                        else{
                            $reply=$total_word[2]." tidak terdaftar atau belum mengikuti kuliah";
                        }

                    }
                    else{
                        $reply="Kelas tidak terdaftar";
                    }

                }
                else{
                    $reply="Format salah, ulangi lagi";
                }
            }
            else{
                $reply = "Format salah, ulangi lagi";  
            }
        }
        else
        {
             $reply = "Format salah, ulangi lagi";   
        }

            
        $query3 = "INSERT INTO outbox(DestinationNumber, TextDecoded, creatorID) VALUES('$noPengirim','$reply','Gammu')";
        mysql_query($query3);
        //ubah nilai ‘processed’ menjadi ‘true’ untuk setiap SMS
        //yang telah diproses
        $query3 = "UPDATE inbox SET Processed = 'true' WHERE ID = '$id'";
        mysql_query($query3);
    }
        // echo $reply;
?>