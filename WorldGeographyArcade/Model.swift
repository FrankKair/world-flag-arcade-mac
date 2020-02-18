import Foundation
import Cocoa

struct Country: Hashable {
    let name: String
    let capital: String
    let code: String
    let flag: NSImage
}

struct Round {
    let options: [Country]
    let answer: Country
}

class Game {
    private let countries = Countries()
    private var seen = Set<Country>()
    private var maxScore: Int { return countries.count }
    private var score = 0

    func getCountries() -> Round {
        var options = Set<Country>()

        for _ in (0...3) {
            var country = countries.get()
            while seen.contains(country) || options.contains(country) {
                country = countries.get()
            }
            options.insert(country)
        }

        let answer = options.randomElement()!
        seen.insert(answer)
        return Round(options: Array(options), answer: answer)
    }

    func getScore() -> Int {
        return score
    }

    func updateScore() {
        score += 1
    }

    func resetGame() {
        score = 0
        seen.removeAll(keepingCapacity: true)
    }
}

struct Countries {
    private let data: Set<Country>
    var count: Int { return data.count }

    func get() -> Country {
        return data.randomElement()!
    }

    init() {
        data = Set([
            Country(name: "Andorra", capital: "Andorra la Vella", code: "ad", flag: NSImage(named: "ad")!),
            Country(name: "United Arab Emirates", capital: "Abu Dhabi", code: "ae", flag: NSImage(named: "ae")!),
            Country(name: "Afghanistan", capital: "Kabul", code: "af", flag: NSImage(named: "af")!),
            Country(name: "Antigua and Barbuda", capital: "Saint John's", code: "ag", flag: NSImage(named: "ag")!),
            Country(name: "Anguilla", capital: "The Valley", code: "ai", flag: NSImage(named: "ai")!),
            Country(name: "Albania", capital: "Tirana", code: "al", flag: NSImage(named: "al")!),
            Country(name: "Armenia", capital: "Yerevan", code: "am", flag: NSImage(named: "am")!),
            Country(name: "Angola", capital: "Luanda", code: "ao", flag: NSImage(named: "ao")!),
            Country(name: "Argentina", capital: "Buenos Aires", code: "ar", flag: NSImage(named: "ar")!),
            Country(name: "American Samoa", capital: "Fagatogo", code: "as", flag: NSImage(named: "as")!),
            Country(name: "Austria", capital: "Wien", code: "at", flag: NSImage(named: "at")!),
            Country(name: "Australia", capital: "Canberra", code: "au", flag: NSImage(named: "au")!),
            Country(name: "Aruba", capital: "Oranjestad", code: "aw", flag: NSImage(named: "aw")!),
            Country(name: "Åland Islands", capital: "Mariehamn", code: "ax", flag: NSImage(named: "ax")!),
            Country(name: "Azerbaijan", capital: "Baku", code: "az", flag: NSImage(named: "az")!),
            Country(name: "Bosnia and Herzegovina", capital: "Sarajevo", code: "ba", flag: NSImage(named: "ba")!),
            Country(name: "Barbados", capital: "Bridgetown", code: "bb", flag: NSImage(named: "bb")!),
            Country(name: "Bangladesh", capital: "Dhaka", code: "bd", flag: NSImage(named: "bd")!),
            Country(name: "Belgium", capital: "Bruxelles [Brussel]", code: "be", flag: NSImage(named: "be")!),
            Country(name: "Burkina Faso", capital: "Ouagadougou", code: "bf", flag: NSImage(named: "bf")!),
            Country(name: "Bulgaria", capital: "Sofia", code: "bg", flag: NSImage(named: "bg")!),
            Country(name: "Bahrain", capital: "al-Manama", code: "bh", flag: NSImage(named: "bh")!),
            Country(name: "Burundi", capital: "Bujumbura", code: "bi", flag: NSImage(named: "bi")!),
            Country(name: "Benin", capital: "Porto-Novo", code: "bj", flag: NSImage(named: "bj")!),
            Country(name: "Saint Barthélemy", capital: "Gustavia", code: "bl", flag: NSImage(named: "bl")!),
            Country(name: "Bermuda", capital: "Hamilton", code: "bm", flag: NSImage(named: "bm")!),
            Country(name: "Brunei", capital: "Bandar Seri Begawan", code: "bn", flag: NSImage(named: "bn")!),
            Country(name: "Bolivia", capital: "La Paz", code: "bo", flag: NSImage(named: "bo")!),
            Country(name: "Brazil", capital: "Brasília", code: "br", flag: NSImage(named: "br")!),
            Country(name: "Bahamas", capital: "Nassau", code: "bs", flag: NSImage(named: "bs")!),
            Country(name: "Bhutan", capital: "Thimphu", code: "bt", flag: NSImage(named: "bt")!),
            Country(name: "Botswana", capital: "Gaborone", code: "bw", flag: NSImage(named: "bw")!),
            Country(name: "Belarus", capital: "Minsk", code: "by", flag: NSImage(named: "by")!),
            Country(name: "Belize", capital: "Belmopan", code: "bz", flag: NSImage(named: "bz")!),
            Country(name: "Canada", capital: "Ottawa", code: "ca", flag: NSImage(named: "ca")!),
            Country(name: "Cocos (Keeling) Islands", capital: "West Island", code: "cc", flag: NSImage(named: "cc")!),
            Country(name: "Democratic Republic of the Congo", capital: "Kinshasa", code: "cd", flag: NSImage(named: "cd")!),
            Country(name: "Central African Republic", capital: "Bangui", code: "cf", flag: NSImage(named: "cf")!),
            Country(name: "Congo", capital: "Brazzaville", code: "cg", flag: NSImage(named: "cg")!),
            Country(name: "Switzerland", capital: "Bern", code: "ch", flag: NSImage(named: "ch")!),
            Country(name: "Ivory Coast", capital: "Yamoussoukro", code: "ci", flag: NSImage(named: "ci")!),
            Country(name: "Cook Islands", capital: "Avarua", code: "ck", flag: NSImage(named: "ck")!),
            Country(name: "Chile", capital: "Santiago de Chile", code: "cl", flag: NSImage(named: "cl")!),
            Country(name: "Cameroon", capital: "Yaound", code: "cm", flag: NSImage(named: "cm")!),
            Country(name: "China", capital: "Peking", code: "cn", flag: NSImage(named: "cn")!),
            Country(name: "Colombia", capital: "Santaf", code: "co", flag: NSImage(named: "co")!),
            Country(name: "Costa Rica", capital: "San Jos", code: "cr", flag: NSImage(named: "cr")!),
            Country(name: "Cuba", capital: "La Habana", code: "cu", flag: NSImage(named: "cu")!),
            Country(name: "Cape Verde", capital: "Praia", code: "cv", flag: NSImage(named: "cv")!),
            Country(name: "Curacao", capital: "Willemstad", code: "cw", flag: NSImage(named: "cw")!),
            Country(name: "Christmas Island", capital: "Flying Fish Cove", code: "cx", flag: NSImage(named: "cx")!),
            Country(name: "Cyprus", capital: "Nicosia", code: "cy", flag: NSImage(named: "cy")!),
            Country(name: "Czech Republic", capital: "Praha", code: "cz", flag: NSImage(named: "cz")!),
            Country(name: "Germany", capital: "Berlin", code: "de", flag: NSImage(named: "de")!),
            Country(name: "Djibouti", capital: "Djibouti", code: "dj", flag: NSImage(named: "dj")!),
            Country(name: "Denmark", capital: "Copenhagen", code: "dk", flag: NSImage(named: "dk")!),
            Country(name: "Dominica", capital: "Roseau", code: "dm", flag: NSImage(named: "dm")!),
            Country(name: "Dominican Republic", capital: "Santo Domingo de Guzm", code: "do", flag: NSImage(named: "do")!),
            Country(name: "Algeria", capital: "Alger", code: "dz", flag: NSImage(named: "dz")!),
            Country(name: "Ecuador", capital: "Quito", code: "ec", flag: NSImage(named: "ec")!),
            Country(name: "Estonia", capital: "Tallinn", code: "ee", flag: NSImage(named: "ee")!),
            Country(name: "Egypt", capital: "Cairo", code: "eg", flag: NSImage(named: "eg")!),
            Country(name: "Western Sahara", capital: "El-Aai", code: "eh", flag: NSImage(named: "eh")!),
            Country(name: "Eritrea", capital: "Asmara", code: "er", flag: NSImage(named: "er")!),
            Country(name: "Spain", capital: "Madrid", code: "es", flag: NSImage(named: "es")!),
            Country(name: "Ethiopia", capital: "Addis Abeba", code: "et", flag: NSImage(named: "et")!),
            Country(name: "Finland", capital: "Helsinki [Helsingfors]", code: "fi", flag: NSImage(named: "fi")!),
            Country(name: "Fiji", capital: "Suva", code: "fj", flag: NSImage(named: "fj")!),
            Country(name: "Falkland Islands", capital: "Stanley", code: "fk", flag: NSImage(named: "fk")!),
            Country(name: "Micronesia, Federated States of", capital: "Palikir", code: "fm", flag: NSImage(named: "fm")!),
            Country(name: "Faroe Islands", capital: "Tórshavn", code: "fo", flag: NSImage(named: "fo")!),
            Country(name: "France", capital: "Paris", code: "fr", flag: NSImage(named: "fr")!),
            Country(name: "Gabon", capital: "Libreville", code: "ga", flag: NSImage(named: "ga")!),
            Country(name: "England", capital: "London", code: "gb-eng", flag: NSImage(named: "gb-eng")!),
            Country(name: "Northern Ireland", capital: "Belfast", code: "gb-nir", flag: NSImage(named: "gb-nir")!),
            Country(name: "Scotland", capital: "Edinburgh", code: "gb-sct", flag: NSImage(named: "gb-sct")!),
            Country(name: "Wales", capital: "Cardiff", code: "gb-wls", flag: NSImage(named: "gb-wls")!),
            Country(name: "United Kingdom", capital: "London", code: "gb", flag: NSImage(named: "gb")!),
            Country(name: "Grenada", capital: "Saint George's", code: "gd", flag: NSImage(named: "gd")!),
            Country(name: "Georgia", capital: "Tbilisi", code: "ge", flag: NSImage(named: "ge")!),
            Country(name: "French Guiana", capital: "Cayenne", code: "gf", flag: NSImage(named: "gf")!),
            Country(name: "Guernsey", capital: "St Peter Port", code: "gg", flag: NSImage(named: "gg")!),
            Country(name: "Ghana", capital: "Accra", code: "gh", flag: NSImage(named: "gh")!),
            Country(name: "Gibraltar", capital: "Gibraltar", code: "gi", flag: NSImage(named: "gi")!),
            Country(name: "Greenland", capital: "Nuuk", code: "gl", flag: NSImage(named: "gl")!),
            Country(name: "Gambia", capital: "Banjul", code: "gm", flag: NSImage(named: "gm")!),
            Country(name: "Guinea", capital: "Conakry", code: "gn", flag: NSImage(named: "gn")!),
            Country(name: "Guadeloupe", capital: "Basse-Terre", code: "gp", flag: NSImage(named: "gp")!),
            Country(name: "Equatorial Guinea", capital: "Malabo", code: "gq", flag: NSImage(named: "gq")!),
            Country(name: "Greece", capital: "Athenai", code: "gr", flag: NSImage(named: "gr")!),
            Country(name: "South Georgia and the South Sandwich Islands", capital: "King Edward Point", code: "gs", flag: NSImage(named: "gs")!),
            Country(name: "Guatemala", capital: "Ciudad de Guatemala", code: "gt", flag: NSImage(named: "gt")!),
            Country(name: "Guam", capital: "Aga", code: "gu", flag: NSImage(named: "gu")!),
            Country(name: "Guinea-Bissau", capital: "Bissau", code: "gw", flag: NSImage(named: "gw")!),
            Country(name: "Guyana", capital: "Georgetown", code: "gy", flag: NSImage(named: "gy")!),
            Country(name: "Hong Kong", capital: "Victoria", code: "hk", flag: NSImage(named: "hk")!),
            Country(name: "Honduras", capital: "Tegucigalpa", code: "hn", flag: NSImage(named: "hn")!),
            Country(name: "Croatia", capital: "Zagreb", code: "hr", flag: NSImage(named: "hr")!),
            Country(name: "Haiti", capital: "Port-au-Prince", code: "ht", flag: NSImage(named: "ht")!),
            Country(name: "Hungary", capital: "Budapest", code: "hu", flag: NSImage(named: "hu")!),
            Country(name: "Indonesia", capital: "Jakarta", code: "id", flag: NSImage(named: "id")!),
            Country(name: "Ireland", capital: "Dublin", code: "ie", flag: NSImage(named: "ie")!),
            Country(name: "Israel", capital: "Jerusalem", code: "il", flag: NSImage(named: "il")!),
            Country(name: "Isle of Man", capital: "Douglas", code: "im", flag: NSImage(named: "im")!),
            Country(name: "India", capital: "New Delhi", code: "in", flag: NSImage(named: "in")!),
            Country(name: "British Indian Ocean Territory", capital: "Camp Justice", code: "io", flag: NSImage(named: "io")!),
            Country(name: "Iraq", capital: "Baghdad", code: "iq", flag: NSImage(named: "iq")!),
            Country(name: "Iran", capital: "Tehran", code: "ir", flag: NSImage(named: "ir")!),
            Country(name: "Iceland", capital: "Reykjav", code: "is", flag: NSImage(named: "is")!),
            Country(name: "Italy", capital: "Roma", code: "it", flag: NSImage(named: "it")!),
            Country(name: "Jersey", capital: "Saint Helier", code: "je", flag: NSImage(named: "je")!),
            Country(name: "Jamaica", capital: "Kingston", code: "jm", flag: NSImage(named: "jm")!),
            Country(name: "Jordan", capital: "Amman", code: "jo", flag: NSImage(named: "jo")!),
            Country(name: "Japan", capital: "Tokyo", code: "jp", flag: NSImage(named: "jp")!),
            Country(name: "Kenya", capital: "Nairobi", code: "ke", flag: NSImage(named: "ke")!),
            Country(name: "Kyrgyzstan", capital: "Bishkek", code: "kg", flag: NSImage(named: "kg")!),
            Country(name: "Cambodia", capital: "Phnom Penh", code: "kh", flag: NSImage(named: "kh")!),
            Country(name: "Kiribati", capital: "Bairiki", code: "ki", flag: NSImage(named: "ki")!),
            Country(name: "Comoros", capital: "Moroni", code: "km", flag: NSImage(named: "km")!),
            Country(name: "Saint Kitts and Nevis", capital: "Basseterre", code: "kn", flag: NSImage(named: "kn")!),
            Country(name: "North Korea", capital: "Pyongyang", code: "kp", flag: NSImage(named: "kp")!),
            Country(name: "South Korea", capital: "Seoul", code: "kr", flag: NSImage(named: "kr")!),
            Country(name: "Kuwait", capital: "Kuwait", code: "kw", flag: NSImage(named: "kw")!),
            Country(name: "Cayman Islands", capital: "George Town", code: "ky", flag: NSImage(named: "ky")!),
            Country(name: "Kazakhstan", capital: "Astana", code: "kz", flag: NSImage(named: "kz")!),
            Country(name: "Laos", capital: "Vientiane", code: "la", flag: NSImage(named: "la")!),
            Country(name: "Lebanon", capital: "Beirut", code: "lb", flag: NSImage(named: "lb")!),
            Country(name: "Saint Lucia", capital: "Castries", code: "lc", flag: NSImage(named: "lc")!),
            Country(name: "Liechtenstein", capital: "Vaduz", code: "li", flag: NSImage(named: "li")!),
            Country(name: "Sri Lanka", capital: "Sri Jayawardenepura Kotte", code: "lk", flag: NSImage(named: "lk")!),
            Country(name: "Liberia", capital: "Monrovia", code: "lr", flag: NSImage(named: "lr")!),
            Country(name: "Lesotho", capital: "Maseru", code: "ls", flag: NSImage(named: "ls")!),
            Country(name: "Lithuania", capital: "Vilnius", code: "lt", flag: NSImage(named: "lt")!),
            Country(name: "Luxembourg", capital: "Luxembourg City", code: "lu", flag: NSImage(named: "lu")!),
            Country(name: "Latvia", capital: "Riga", code: "lv", flag: NSImage(named: "lv")!),
            Country(name: "Libya", capital: "Tripoli", code: "ly", flag: NSImage(named: "ly")!),
            Country(name: "Morocco", capital: "Rabat", code: "ma", flag: NSImage(named: "ma")!),
            Country(name: "Monaco", capital: "Monaco-Ville", code: "mc", flag: NSImage(named: "mc")!),
            Country(name: "Moldova", capital: "Chisinau", code: "md", flag: NSImage(named: "md")!),
            Country(name: "Montenegro", capital: "Podgorica", code: "me", flag: NSImage(named: "me")!),
            Country(name: "Madagascar", capital: "Antananarivo", code: "mg", flag: NSImage(named: "mg")!),
            Country(name: "Marshall Islands", capital: "Dalap-Uliga-Darrit", code: "mh", flag: NSImage(named: "mh")!),
            Country(name: "Macedonia", capital: "Skopje", code: "mk", flag: NSImage(named: "mk")!),
            Country(name: "Mali", capital: "Bamako", code: "ml", flag: NSImage(named: "ml")!),
            Country(name: "Myanmar", capital: "Rangoon (Yangon)", code: "mm", flag: NSImage(named: "mm")!),
            Country(name: "Mongolia", capital: "Ulan Bator", code: "mn", flag: NSImage(named: "mn")!),
            Country(name: "Macao", capital: "Macao", code: "mo", flag: NSImage(named: "mo")!),
            Country(name: "Northern Mariana Islands", capital: "Garapan", code: "mp", flag: NSImage(named: "mp")!),
            Country(name: "Martinique", capital: "Fort-de-France", code: "mq", flag: NSImage(named: "mq")!),
            Country(name: "Mauritania", capital: "Nouakchott", code: "mr", flag: NSImage(named: "mr")!),
            Country(name: "Montserrat", capital: "Plymouth", code: "ms", flag: NSImage(named: "ms")!),
            Country(name: "Malta", capital: "Valletta", code: "mt", flag: NSImage(named: "mt")!),
            Country(name: "Mauritius", capital: "Port-Louis", code: "mu", flag: NSImage(named: "mu")!),
            Country(name: "Maldives", capital: "Male", code: "mv", flag: NSImage(named: "mv")!),
            Country(name: "Malawi", capital: "Lilongwe", code: "mw", flag: NSImage(named: "mw")!),
            Country(name: "Mexico", capital: "Ciudad de M", code: "mx", flag: NSImage(named: "mx")!),
            Country(name: "Malaysia", capital: "Kuala Lumpur", code: "my", flag: NSImage(named: "my")!),
            Country(name: "Mozambique", capital: "Maputo", code: "mz", flag: NSImage(named: "mz")!),
            Country(name: "Namibia", capital: "Windhoek", code: "na", flag: NSImage(named: "na")!),
            Country(name: "New Caledonia", capital: "Noum", code: "nc", flag: NSImage(named: "nc")!),
            Country(name: "Niger", capital: "Niamey", code: "ne", flag: NSImage(named: "ne")!),
            Country(name: "Norfolk Island", capital: "Kingston", code: "nf", flag: NSImage(named: "nf")!),
            Country(name: "Nigeria", capital: "Abuja", code: "ng", flag: NSImage(named: "ng")!),
            Country(name: "Nicaragua", capital: "Managua", code: "ni", flag: NSImage(named: "ni")!),
            Country(name: "Netherlands", capital: "Amsterdam", code: "nl", flag: NSImage(named: "nl")!),
            Country(name: "Norway", capital: "Oslo", code: "no", flag: NSImage(named: "no")!),
            Country(name: "Nepal", capital: "Kathmandu", code: "np", flag: NSImage(named: "np")!),
            Country(name: "Nauru", capital: "Yaren", code: "nr", flag: NSImage(named: "nr")!),
            Country(name: "Niue", capital: "Alofi", code: "nu", flag: NSImage(named: "nu")!),
            Country(name: "New Zealand", capital: "Wellington", code: "nz", flag: NSImage(named: "nz")!),
            Country(name: "Oman", capital: "Masqat", code: "om", flag: NSImage(named: "om")!),
            Country(name: "Panama", capital: "Ciudad de Panam", code: "pa", flag: NSImage(named: "pa")!),
            Country(name: "Peru", capital: "Lima", code: "pe", flag: NSImage(named: "pe")!),
            Country(name: "French Polynesia", capital: "Papeete", code: "pf", flag: NSImage(named: "pf")!),
            Country(name: "Papua New Guinea", capital: "Port Moresby", code: "pg", flag: NSImage(named: "pg")!),
            Country(name: "Philippines", capital: "Manila", code: "ph", flag: NSImage(named: "ph")!),
            Country(name: "Pakistan", capital: "Islamabad", code: "pk", flag: NSImage(named: "pk")!),
            Country(name: "Poland", capital: "Warszawa", code: "pl", flag: NSImage(named: "pl")!),
            Country(name: "Saint Pierre and Miquelon", capital: "Saint-Pierre", code: "pm", flag: NSImage(named: "pm")!),
            Country(name: "Pitcairn", capital: "Adamstown", code: "pn", flag: NSImage(named: "pn")!),
            Country(name: "Puerto Rico", capital: "San Juan", code: "pr", flag: NSImage(named: "pr")!),
            Country(name: "Palestine", capital: "Gaza", code: "ps", flag: NSImage(named: "ps")!),
            Country(name: "Portugal", capital: "Lisboa", code: "pt", flag: NSImage(named: "pt")!),
            Country(name: "Palau", capital: "Koror", code: "pw", flag: NSImage(named: "pw")!),
            Country(name: "Paraguay", capital: "Asunci", code: "py", flag: NSImage(named: "py")!),
            Country(name: "Qatar", capital: "Doha", code: "qa", flag: NSImage(named: "qa")!),
            Country(name: "Réunion", capital: "Saint-Denis", code: "re", flag: NSImage(named: "re")!),
            Country(name: "Romania", capital: "Bucuresti", code: "ro", flag: NSImage(named: "ro")!),
            Country(name: "Serbia", capital: "Belgrade", code: "rs", flag: NSImage(named: "rs")!),
            Country(name: "Russian Federation", capital: "Moscow", code: "ru", flag: NSImage(named: "ru")!),
            Country(name: "Rwanda", capital: "Kigali", code: "rw", flag: NSImage(named: "rw")!),
            Country(name: "Saudi Arabia", capital: "Riyadh", code: "sa", flag: NSImage(named: "sa")!),
            Country(name: "Solomon Islands", capital: "Honiara", code: "sb", flag: NSImage(named: "sb")!),
            Country(name: "Seychelles", capital: "Victoria", code: "sc", flag: NSImage(named: "sc")!),
            Country(name: "Sudan", capital: "Khartum", code: "sd", flag: NSImage(named: "sd")!),
            Country(name: "Sweden", capital: "Stockholm", code: "se", flag: NSImage(named: "se")!),
            Country(name: "Singapore", capital: "Singapore", code: "sg", flag: NSImage(named: "sg")!),
            Country(name: "Slovenia", capital: "Ljubljana", code: "si", flag: NSImage(named: "si")!),
            Country(name: "Svalbard and Jan Mayen", capital: "Longyearbyen", code: "sj", flag: NSImage(named: "sj")!),
            Country(name: "Slovakia", capital: "Bratislava", code: "sk", flag: NSImage(named: "sk")!),
            Country(name: "Sierra Leone", capital: "Freetown", code: "sl", flag: NSImage(named: "sl")!),
            Country(name: "San Marino", capital: "San Marino", code: "sm", flag: NSImage(named: "sm")!),
            Country(name: "Senegal", capital: "Dakar", code: "sn", flag: NSImage(named: "sn")!),
            Country(name: "Somalia", capital: "Mogadishu", code: "so", flag: NSImage(named: "so")!),
            Country(name: "Suriname", capital: "Paramaribo", code: "sr", flag: NSImage(named: "sr")!),
            Country(name: "South Sudan", capital: "Juba", code: "ss", flag: NSImage(named: "ss")!),
            Country(name: "Sao Tome and Principe", capital: "S", code: "st", flag: NSImage(named: "st")!),
            Country(name: "El Salvador", capital: "San Salvador", code: "sv", flag: NSImage(named: "sv")!),
            Country(name: "Saint Maarten", capital: "Philipsburg", code: "sx", flag: NSImage(named: "sx")!),
            Country(name: "Syria", capital: "Damascus", code: "sy", flag: NSImage(named: "sy")!),
            Country(name: "Swaziland", capital: "Mbabane", code: "sz", flag: NSImage(named: "sz")!),
            Country(name: "Turks and Caicos Islands", capital: "Cockburn Town", code: "tc", flag: NSImage(named: "tc")!),
            Country(name: "Chad", capital: "N'Djam", code: "td", flag: NSImage(named: "td")!),
            Country(name: "French Southern Territories", capital: "Saint-Pierre", code: "tf", flag: NSImage(named: "tf")!),
            Country(name: "Togo", capital: "Lom", code: "tg", flag: NSImage(named: "tg")!),
            Country(name: "Thailand", capital: "Bangkok", code: "th", flag: NSImage(named: "th")!),
            Country(name: "Tajikistan", capital: "Dushanbe", code: "tj", flag: NSImage(named: "tj")!),
            Country(name: "Tokelau", capital: "Fakaofo", code: "tk", flag: NSImage(named: "tk")!),
            Country(name: "East Timor", capital: "Dili", code: "tl", flag: NSImage(named: "tl")!),
            Country(name: "Turkmenistan", capital: "Ashgabat", code: "tm", flag: NSImage(named: "tm")!),
            Country(name: "Tunisia", capital: "Tunis", code: "tn", flag: NSImage(named: "tn")!),
            Country(name: "Tonga", capital: "Nuku'alofa", code: "to", flag: NSImage(named: "to")!),
            Country(name: "Turkey", capital: "Ankara", code: "tr", flag: NSImage(named: "tr")!),
            Country(name: "Trinidad and Tobago", capital: "Port-of-Spain", code: "tt", flag: NSImage(named: "tt")!),
            Country(name: "Tuvalu", capital: "Funafuti", code: "tv", flag: NSImage(named: "tv")!),
            Country(name: "Taiwan", capital: "Taipei", code: "tw", flag: NSImage(named: "tw")!),
            Country(name: "Tanzania", capital: "Dodoma", code: "tz", flag: NSImage(named: "tz")!),
            Country(name: "Ukraine", capital: "Kyiv", code: "ua", flag: NSImage(named: "ua")!),
            Country(name: "Uganda", capital: "Kampala", code: "ug", flag: NSImage(named: "ug")!),
            Country(name: "United States", capital: "Washington", code: "us", flag: NSImage(named: "us")!),
            Country(name: "Uruguay", capital: "Montevideo", code: "uy", flag: NSImage(named: "uy")!),
            Country(name: "Uzbekistan", capital: "Toskent", code: "uz", flag: NSImage(named: "uz")!),
            Country(name: "Holy See (Vatican City State)", capital: "Vatican City", code: "va", flag: NSImage(named: "va")!),
            Country(name: "Saint Vincent and the Grenadines", capital: "Kingstown", code: "vc", flag: NSImage(named: "vc")!),
            Country(name: "Venezuela", capital: "Caracas", code: "ve", flag: NSImage(named: "ve")!),
            Country(name: "Virgin Islands, British", capital: "Road Town", code: "vg", flag: NSImage(named: "vg")!),
            Country(name: "Virgin Islands, U.S.", capital: "Charlotte Amalie", code: "vi", flag: NSImage(named: "vi")!),
            Country(name: "Vietnam", capital: "Hanoi", code: "vn", flag: NSImage(named: "vn")!),
            Country(name: "Vanuatu", capital: "Port-Vila", code: "vu", flag: NSImage(named: "vu")!),
            Country(name: "Wallis and Futuna", capital: "Mata-Utu", code: "wf", flag: NSImage(named: "wf")!),
            Country(name: "Kosovo", capital: "Pristina", code: "xk", flag: NSImage(named: "xk")!),
            Country(name: "Samoa", capital: "Apia", code: "ws", flag: NSImage(named: "ws")!),
            Country(name: "Yemen", capital: "Sanaa", code: "ye", flag: NSImage(named: "ye")!),
            Country(name: "Mayotte", capital: "Mamoutzou", code: "yt", flag: NSImage(named: "yt")!),
            Country(name: "South Africa", capital: "Pretoria", code: "za", flag: NSImage(named: "za")!),
            Country(name: "Zambia", capital: "Lusaka", code: "zm", flag: NSImage(named: "zm")!),
            Country(name: "Zimbabwe", capital: "Harare", code: "zw", flag: NSImage(named: "zw")!)
        ])
    }
}
