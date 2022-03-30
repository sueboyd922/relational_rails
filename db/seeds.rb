# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.destroy_all
Player.destroy_all

jas = Team.create!(name: "Josh Allen's Shorts", games_played: 10, winning_record: true)
diggs = Team.create!(name: "Can You Diggs It", games_played: 11, winning_record: true)
dak = Team.create!(name: "DakStreet Boys", games_played: 10, winning_record: false)
met = Team.create!(name: "How I Metcalf Your Mother", games_played: 11, winning_record: false)
punt = Team.create!(name: "No Punt Intended", games_played: 10, winning_record: true)

#jas teams
josh = Player.create!(name: "Josh Allen", position: "QB", points: 240, active: true, team_id: jas.id)
davante = Player.create!(name: "Davante Adams", position: "WR", points: 140, active: true, team_id: jas.id)
alvin = Player.create!(name: "Alvin Kamara", position: "RB", points: 138, active: true, team_id: jas.id)
harris = Player.create!(name: "Damien Harris", position: "RB", points: 120, active: false, team_id: jas.id)
higbee = Player.create!(name: "Tyler Higbee", position: "TE", points: 55, active: true, team_id: jas.id)
folk = Player.create!(name: "Nick Folk", position: "K", points: 102, active: true, team_id: jas.id)

#diggs
herb = Player.create!(name: "Justin Herbert", position: "QB", points: 249, active: true, team_id: diggs.id)
jon = Player.create!(name: "Jonathan Taylor", position: "RB", points: 220, active: true, team_id: diggs.id)
stef = Player.create!(name: "Stefon Diggs", position: "WR", points: 110, active: true, team_id: diggs.id)
lockett = Player.create!(name: "Tyler Lockett", position: "WR", points: 113, active: false, team_id: diggs.id)
kelce = Player.create!(name: "Travis Kelce", position: "TE", points: 125, active: true, team_id: diggs.id)

#dak
dak.players.create!(name: "Dak Prescott", position: "QB", points: 209, active: true)
dak.players.create!(name: "Cooper Kupp", position: "WR", points: 192, active: true)
dak.players.create!(name: "Leonard Fournette", position: "RB", points: 138, active: false)
dak.players.create!(name: "Dawson Knox", position: "TE", points: 79, active: true)
dak.players.create!(name: "Nick Chubb", position: "RB", points: 140, active: true)
dak.players.create!(name: "Matt Gay", position: "K", points: 96, active: false)
dak.players.create!(name: "Greg Joseph", position: "K", points: 98, active: true)

#met
pat = met.players.create!(name: "Patrick Mahomes", position: "QB", points: 232, active: true)
dkm = met.players.create!(name: "DK Metcalf", position: "WR", points: 112, active: true)
cook = met.players.create!(name: "Dalvin Cook", position: "RB", points: 143, active: false)
sam = met.players.create!(name: "Sam Darnold", position: "QB", points: 154, active: false)
david = met.players.create!(name: "David Montgomery", position: "RB", points: 110, active: true)

#punt
matt = punt.players.create!(name: "Matthew Stafford", position: "QB", points: 228, active: true)
just = punt.players.create!(name: "Justin Jefferson", position: "WR", points: 143, active: true)
zeke = punt.players.create!(name: "Ezekiel Elliot", position: "RB", points: 133, active: true)
lamb = punt.players.create!(name: "CeeDee Lamb", position: "WR", points: 93, active: true)
kitt = punt.players.create!(name: "George Kittle", position: "TE", points: 89, active: true)
