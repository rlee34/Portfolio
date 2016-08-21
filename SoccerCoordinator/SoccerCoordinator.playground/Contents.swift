//set up data for all players

var joeSmith = [
  "name": "Joe Smith",
  "height": "42",
  "soccerExp": "YES",
  "guardianNames": "Jim and Jan Smith"
]

var jillTanner = [
    "name": "Jill Tanner",
    "height": "36",
    "soccerExp": "YES",
    "guardianNames": "Clara Tanner"
]

var billBon = [
    "name": "Bill Bon",
    "height": "43",
    "soccerExp": "YES",
    "guardianNames": "Sara and Jenny Bon"
]

var evaGordon = [
    "name": "Eva Gordon",
    "height": "45",
    "soccerExp": "NO",
    "guardianNames": "Wendy and Mike Gordon"
]

var mattGill = [
    "name": "Matt Gill",
    "height": "40",
    "soccerExp": "NO",
    "guardianNames": "Charles and Sylvia Gill"
]

var kimmyStein = [
    "name": "Kimmy Stein",
    "height": "41",
    "soccerExp": "NO",
    "guardianNames": "Bill and Hillary Stein"
]

var sammyAdams = [
    "name": "Sammy Adams",
    "height": "45",
    "soccerExp": "NO",
    "guardianNames": "Jeff Adams"
]

var karlSaygan = [
    "name": "Karl Saygan",
    "height": "42",
    "soccerExp": "YES",
    "guardianNames": "Heather Bledsoe"
]

var suzaneGreenberg = [
    "name": "Suzane Greenberg",
    "height": "44",
    "soccerExp": "YES",
    "guardianNames": "Henrietta Dumas"
]

var salDali = [
    "name": "Sal Dali",
    "height": "41",
    "soccerExp": "NO",
    "guardianNames": "Gala Dali"
]

var joeKavalier = [
    "name": "Joe Kavalier",
    "height": "39",
    "soccerExp": "NO",
    "guardianNames": "Sam and Elaine Kavalier"
]

var benFinkelstein = [
    "name": "Ben Finkelstein",
    "height": "44",
    "soccerExp": "NO",
    "guardianNames": "Aaron and Jill Finkelstein"
]

var diegoSoto = [
    "name": "Diego Soto",
    "height": "41",
    "soccerExp": "YES",
    "guardianNames": "Robin and Sarika Soto"
]

var chloeAlaska = [
    "name": "Chloe Alaska",
    "height": "47",
    "soccerExp": "NO",
    "guardianNames": "David and Jamie Alaska"
]

var arnoldWillis = [
    "name": "Arnold Willis",
    "height": "43",
    "soccerExp": "NO",
    "guardianNames": "Claire Willis"
]

var phillipHelm = [
    "name": "Phillip Helm",
    "height": "44",
    "soccerExp": "YES",
    "guardianNames": "Thomas Helm and Eva Jones"
]

var lesClay = [
    "name": "Les Clay",
    "height": "42",
    "soccerExp": "YES",
    "guardianNames": "Wynonna Brown"
]

var herschelKrustofski = [
    "name": "Herschel Krustofski",
    "height": "45",
    "soccerExp": "YES",
    "guardianNames": "Hyman and Rachel Krustofski"
]

// This array holds all players and their information
var allPlayers = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzaneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]

// Set up empty arrays to hold players delivered via function
var dragons: [Dictionary<String, String>] = []
var sharks: [Dictionary<String, String>] = []
var raptors: [Dictionary<String, String>] = []


func sortPlayers(players: [[String: String]]) {
    var xpPlayerCount = 0
    
    for var player in players {
        //if player has experience, do checks to see which team (s)he should go to
        if player["soccerExp"] == "YES" {
            //if number of experienced players in team dragons is lower than that of team sharks and team raptors, place player there and increment xpPlayer count and do this for each subsequent team
            if xpPlayerCount % 3 == 0 {
                player.updateValue("Dragons", forKey: "team")
                dragons.append(player)
                xpPlayerCount += 1
            } else if xpPlayerCount % 2 == 0 {
                player.updateValue("Raptors", forKey: "team")
                raptors.append(player)
                xpPlayerCount += 1
            } else {
                player.updateValue("Sharks", forKey: "team")
                sharks.append(player)
                xpPlayerCount += 1
            }
        } else {
            //if the player doesn't have experience, add (s)he to one of the teams with least amount of players
            if dragons.count < sharks.count || dragons.count < raptors.count {
                player.updateValue("Dragons", forKey: "team")
                dragons.append(player)
            } else if raptors.count < dragons.count || raptors.count < sharks.count {
                player.updateValue("Raptors", forKey: "team")
                raptors.append(player)
            } else {
                player.updateValue("Sharks", forKey: "team")
                sharks.append(player)
            }
        }
    }
}

func notifyGuardians(players: [Dictionary<String, String>], date: String) {
    
    for player in players {
        print("Dear \(player["guardianNames"]!), The 2016 Youth Soccer Leauge is now underway! Your child, \(player["name"]!) will be playing for the \(player["team"]!) this year. I am writing to inform you that \(player["name"]!)'s first match will be on \(date). Parents/Guardians are obligated to send in payment of $47.50 by 3/1/2016 to cover uniform and training equipment for each child. Directions to the soccer field will be posted on the bulletin board at the entrance of the elementary school gym, we will also be taking the team bus if you'd like to follow us you are more than welcome to, we will be meeting on the west side of the school grounds under the bus stop 1 hour before the game starts, please be early so you are not left behind as we will be leaving promptly. As always should you have any questions or concerns please feel free to reach out to me. -Coach")
    }
}

// run function to sort players into teams
sortPlayers(allPlayers)

// generate letters to parents/guardians
notifyGuardians(dragons, date: "March 17th @ 1 p.m.")
notifyGuardians(sharks, date: "March 17th @ 3 p.m.")
notifyGuardians(raptors, date: "March 18th @ 1 p.m.")
