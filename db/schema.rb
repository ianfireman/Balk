# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151210050442) do

  create_table "clientes", force: :cascade do |t|
    t.string   "nome_fantasia"
    t.string   "email"
    t.string   "cnpj"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "razao_soc"
    t.string   "inscricao_es"
    t.string   "nome_comprador"
    t.string   "nome_banco"
    t.string   "agencia"
    t.string   "conta_corrente"
    t.integer  "empresa_id"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "adress"
  end
  
  add_index "clientes", ["created_at"], name: "index_clientes_on_user_id_and_empresa_id_and_created_at"
  add_index "clientes", ["empresa_id", "created_at"], name: "index_clientes_on_empresa_id_and_created_at"
  add_index "clientes", ["empresa_id"], name: "index_clientes_on_empresa_id"

  create_table "collections", force: :cascade do |t|
    t.string   "name"
    t.date     "data_inicio"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "empresa_id"
  end

  add_index "collections", ["empresa_id", "created_at"], name: "index_collections_on_empresa_id_and_created_at"
  add_index "collections", ["empresa_id"], name: "index_collections_on_empresa_id"

  create_table "empresas", force: :cascade do |t|
    t.string   "nome_fantasia"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "cnpj"
    t.string   "razao_soc"
    t.integer  "user_id"
  end

  add_index "empresas", ["user_id", "created_at"], name: "index_empresas_on_user_id_and_created_at"
  add_index "empresas", ["user_id"], name: "index_empresas_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "referencia"
    t.float    "preco_unitario"
    t.string   "info"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "collection_id"
  end

  add_index "items", ["collection_id", "created_at"], name: "index_items_on_collection_id_and_created_at"
  add_index "items", ["collection_id"], name: "index_items_on_collection_id"
  add_index "items", ["referencia"], name: "index_items_on_referencia", unique: true

  create_table "pedidos", force: :cascade do |t|
    t.integer  "qtd_itens"
    t.float    "preco_total"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "cliente_id"
  end

  add_index "pedidos", ["cliente_id", "created_at"], name: "index_pedidos_on_cliente_id_and_created_at"
  add_index "pedidos", ["cliente_id"], name: "index_pedidos_on_cliente_id"

  create_table "relations", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "cliente_id"
    t.integer  "item_id"
    t.integer  "quantidade", default: 0
    t.integer  "pedido_id"
  end

  add_index "relations", ["cliente_id", "created_at", "item_id"], name: "index_relations_on_cliente_id_and_created_at_and_item_id"
  add_index "relations", ["cliente_id"], name: "index_relations_on_cliente_id"
  add_index "relations", ["item_id"], name: "index_relations_on_item_id"
  add_index "relations", ["pedido_id", "created_at"], name: "index_relations_on_pedido_id_and_created_at"
  add_index "relations", ["pedido_id"], name: "index_relations_on_pedido_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "active_empresa",    default: 0
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
