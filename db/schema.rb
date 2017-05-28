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

ActiveRecord::Schema.define(version: 20170528133631) do

  create_table "dosens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "nim"
    t.date     "date_birth"
    t.string   "place_birth"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mahasiswas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "nim"
    t.date     "date_birth"
    t.string   "place_birth"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.date     "date_birth"
    t.string   "place_birth"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
