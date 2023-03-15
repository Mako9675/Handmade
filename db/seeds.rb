# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    name: '管理者',
    email: 'test@gmail.com',
    password: 'testtest',
)

Genre.create([
    { name: '手芸/フェルト小物'},
    { name: '手芸/布小物'},
    { name: '手芸/編み物'},
    { name: '手芸/刺繍'},
    { name: '手芸/洋服・ファッション小物'},
    { name: '手芸/人形・ぬいぐるみ'},
    { name: '手芸/パッチワーク'},
    { name: '手芸/羊毛フェルト'},
    { name: '手芸/アクセサリー'},
    { name: '手芸/レザークラフト'},
    
    { name: 'DIY/小物・装飾'},
    { name: 'DIY/テーブル'},
    { name: 'DIY/本棚・棚'},
    { name: 'DIY/椅子'},
    { name: 'DIY/リノベーション'},
    ])