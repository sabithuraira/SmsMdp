# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170822043011) do

  create_table "absensis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "mahasiswa_id"
    t.integer  "kelas_id"
    t.integer  "pertemuan_ke"
    t.integer  "flag"
    t.string   "keterangan"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "daemons", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text "Start", limit: 65535, null: false
    t.text "Info",  limit: 65535, null: false
  end

  create_table "dosens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "nim"
    t.date     "date_birth"
    t.string   "place_birth"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "gammu", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "Version", default: 0, null: false
  end

  create_table "grades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "grade",       limit: 2,                           null: false
    t.decimal  "grade_value",           precision: 64, scale: 12
    t.decimal  "min_value",             precision: 64, scale: 12
    t.decimal  "max_value",             precision: 64, scale: 12
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "inbox", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.datetime "UpdatedInDB",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "ReceivingDateTime",                                                    null: false
    t.text     "Text",              limit: 65535,                                      null: false
    t.string   "SenderNumber",      limit: 20,    default: "",                         null: false
    t.string   "Coding",            limit: 22,    default: "Default_No_Compression",   null: false
    t.text     "UDH",               limit: 65535,                                      null: false
    t.string   "SMSCNumber",        limit: 20,    default: "",                         null: false
    t.integer  "Class",                           default: -1,                         null: false
    t.text     "TextDecoded",       limit: 65535,                                      null: false
    t.text     "RecipientID",       limit: 65535,                                      null: false
    t.string   "Processed",         limit: 5,     default: "false",                    null: false
  end

  create_table "kelas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "dosen_id",          null: false
    t.integer  "mata_pelajaran_id", null: false
    t.string   "tahun_ajaran",      null: false
    t.string   "nama",              null: false
    t.integer  "created_by",        null: false
    t.integer  "updated_by",        null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "sks"
  end

  create_table "kelas_penilaians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "kelas_id"
    t.date     "tanggal"
    t.string   "keterangan"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kelas_pertemuans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "kelas_id"
    t.date     "tanggal"
    t.string   "materi"
    t.string   "keterangan"
    t.integer  "is_before_uts"
    t.integer  "is_before_uas"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "pertemuan_ke"
  end

  create_table "mahasiswa_kelas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "mahasiswa_id"
    t.integer  "kelas_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "abs1"
    t.integer  "abs2"
    t.integer  "abs3"
    t.integer  "abs4"
    t.integer  "abs5"
    t.integer  "abs6"
    t.integer  "abs7"
    t.integer  "abs8"
    t.integer  "abs9"
    t.integer  "abs10"
    t.integer  "abs11"
    t.integer  "abs12"
    t.integer  "abs13"
    t.integer  "abs14"
    t.integer  "abs15"
    t.integer  "abs16"
    t.integer  "abs17"
    t.integer  "abs18"
    t.integer  "abs19"
    t.integer  "abs20"
    t.integer  "abs21"
    t.integer  "abs22"
    t.integer  "abs23"
    t.integer  "abs24"
    t.integer  "abs25"
    t.integer  "abs26"
    t.integer  "abs27"
    t.integer  "abs28"
    t.decimal  "quiz",                   precision: 64, scale: 12
    t.decimal  "uts",                    precision: 64, scale: 12
    t.decimal  "uas",                    precision: 64, scale: 12
    t.decimal  "tugas",                  precision: 64, scale: 12
    t.decimal  "total_nilai",            precision: 64, scale: 12
    t.string   "grade",        limit: 2
  end

  create_table "mahasiswas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "nim"
    t.date     "date_birth"
    t.string   "place_birth"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "parent_phone", null: false
  end

  create_table "mata_pelajarans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nilais", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "dosen"
    t.integer  "mp"
    t.string   "mahasiswa"
    t.string   "tahun_ajaran"
    t.integer  "semester"
    t.decimal  "nilai",        precision: 64, scale: 12
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "outbox", primary_key: "ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.datetime "UpdatedInDB",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "InsertIntoDB",                                                         null: false
    t.datetime "SendingDateTime",                                                      null: false
    t.time     "SendBefore",                      default: '2000-01-01 23:59:59',      null: false
    t.time     "SendAfter",                       default: '2000-01-01 00:00:00',      null: false
    t.text     "Text",              limit: 65535
    t.string   "DestinationNumber", limit: 20,    default: "",                         null: false
    t.string   "Coding",            limit: 22,    default: "Default_No_Compression",   null: false
    t.text     "UDH",               limit: 65535
    t.integer  "Class",                           default: -1
    t.text     "TextDecoded",       limit: 65535,                                      null: false
    t.string   "MultiPart",         limit: 5,     default: "false"
    t.integer  "RelativeValidity",                default: -1
    t.string   "SenderID"
    t.datetime "SendingTimeOut"
    t.string   "DeliveryReport",    limit: 7,     default: "default"
    t.text     "CreatorID",         limit: 65535,                                      null: false
    t.index ["SenderID"], name: "outbox_sender", using: :btree
    t.index ["SendingDateTime", "SendingTimeOut"], name: "outbox_date", using: :btree
  end

  create_table "outbox_multipart", primary_key: ["ID", "SequencePosition"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text    "Text",             limit: 65535
    t.string  "Coding",           limit: 22,    default: "Default_No_Compression", null: false
    t.text    "UDH",              limit: 65535
    t.integer "Class",                          default: -1
    t.text    "TextDecoded",      limit: 65535
    t.integer "ID",                             default: 0,                        null: false, unsigned: true
    t.integer "SequencePosition",               default: 1,                        null: false
  end

  create_table "pbk", primary_key: "ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "GroupID",               default: -1, null: false
    t.text    "Name",    limit: 65535,              null: false
    t.text    "Number",  limit: 65535,              null: false
  end

  create_table "pbk_groups", primary_key: "ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text "Name", limit: 65535, null: false
  end

  create_table "phones", primary_key: "IMEI", id: :string, limit: 35, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text     "ID",           limit: 65535,                                      null: false
    t.datetime "UpdatedInDB",                default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "InsertIntoDB",                                                    null: false
    t.datetime "TimeOut",                                                         null: false
    t.string   "Send",         limit: 3,     default: "no",                       null: false
    t.string   "Receive",      limit: 3,     default: "no",                       null: false
    t.text     "Client",       limit: 65535,                                      null: false
    t.integer  "Battery",                    default: -1,                         null: false
    t.integer  "Signal",                     default: -1,                         null: false
    t.integer  "Sent",                       default: 0,                          null: false
    t.integer  "Received",                   default: 0,                          null: false
  end

  create_table "sentitems", primary_key: ["ID", "SequencePosition"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.datetime "UpdatedInDB",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "InsertIntoDB",                                                         null: false
    t.datetime "SendingDateTime",                                                      null: false
    t.datetime "DeliveryDateTime"
    t.text     "Text",              limit: 65535,                                      null: false
    t.string   "DestinationNumber", limit: 20,    default: "",                         null: false
    t.string   "Coding",            limit: 22,    default: "Default_No_Compression",   null: false
    t.text     "UDH",               limit: 65535,                                      null: false
    t.string   "SMSCNumber",        limit: 20,    default: "",                         null: false
    t.integer  "Class",                           default: -1,                         null: false
    t.text     "TextDecoded",       limit: 65535,                                      null: false
    t.integer  "ID",                              default: 0,                          null: false, unsigned: true
    t.string   "SenderID",                                                             null: false
    t.integer  "SequencePosition",                default: 1,                          null: false
    t.string   "Status",            limit: 17,    default: "SendingOK",                null: false
    t.integer  "StatusError",                     default: -1,                         null: false
    t.integer  "TPMR",                            default: -1,                         null: false
    t.integer  "RelativeValidity",                default: -1,                         null: false
    t.text     "CreatorID",         limit: 65535,                                      null: false
    t.index ["DeliveryDateTime"], name: "sentitems_date", using: :btree
    t.index ["DestinationNumber"], name: "sentitems_dest", using: :btree
    t.index ["SenderID"], name: "sentitems_sender", using: :btree
    t.index ["TPMR"], name: "sentitems_tpmr", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "password"
    t.date     "date_birth"
    t.string   "place_birth"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "level_access"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
