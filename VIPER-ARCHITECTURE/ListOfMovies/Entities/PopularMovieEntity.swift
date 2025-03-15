//
//  PopularMovieEntity.swift
//  VIPER-ARCHITECTURE
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 15/03/25.
//


import Foundation

 struct PopularMovieEntity: Decodable {
    
    // MARK: - PROPERTIES
    let id: Int
    let title: String
    let overview: String
    let poster: String?  // Changed to optional
    let voteAverage: Double
    
    // MARK: ENUM ADOPTING CodingKey
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case poster = "poster_path"
        case voteAverage = "vote_average"
        
    }
    
    // MARK: - DESIGNATER INITIALIZER FOR DEBUGG
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.poster = try container.decodeIfPresent(String.self, forKey: .poster)  // Changed to decodeIfPresent
        self.voteAverage = try container.decode(Double.self, forKey: .voteAverage)
    }
    
}



// De aquí nos quedamos con id, overview, poster_path, vote_average

/*
let dataResult = {
    "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/gFFqWsjLjRfipKzlzaYPD097FNC.jpg",
      "genre_ids": [
        28,
        53,
        80
      ],
      "id": 1126166,
      "original_language": "en",
      "original_title": "Flight Risk",
      "overview": "A U.S. Marshal escorts a government witness to trial after he's accused of getting involved with a mob boss, only to discover that the pilot who is transporting them is also a hitman sent to assassinate the informant. After they subdue him, they're forced to fly together after discovering that there are others attempting to eliminate them.",
      "popularity": 25.919,
      "poster_path": "/q0bCG4NX32iIEsRFZqRtuvzNCyZ.jpg",
      "release_date": "2025-01-22",
      "title": "Flight Risk",
      "video": false,
      "vote_average": 6.1,
      "vote_count": 469
    },
    {
      "adult": false,
      "backdrop_path": "/87GU2ifjNYtgYtcRH1NNH1P4ODo.jpg",
      "genre_ids": [
        18,
        35,
        10749
      ],
      "id": 1064213,
      "original_language": "en",
      "original_title": "Anora",
      "overview": "A young sex worker from Brooklyn gets her chance at a Cinderella story when she meets and impulsively marries the son of an oligarch. Once the news reaches Russia, her fairytale is threatened as his parents set out to get the marriage annulled.",
      "popularity": 20.921,
      "poster_path": "/qh8m8Udz0sCa5gy9VaqfHPh0yPM.jpg",
      "release_date": "2024-10-14",
      "title": "Anora",
      "video": false,
      "vote_average": 7.1,
      "vote_count": 1707
    },
    {
      "adult": false,
      "backdrop_path": "/1w8kutrRucTd3wlYyu5QlUDMiG1.jpg",
      "genre_ids": [
        12,
        10751,
        16
      ],
      "id": 762509,
      "original_language": "en",
      "original_title": "Mufasa: The Lion King",
      "overview": "Mufasa, a cub lost and alone, meets a sympathetic lion named Taka, the heir to a royal bloodline. The chance meeting sets in motion an expansive journey of a group of misfits searching for their destiny.",
      "popularity": 18.25,
      "poster_path": "/lurEK87kukWNaHd0zYnsi3yzJrs.jpg",
      "release_date": "2024-12-18",
      "title": "Mufasa: The Lion King",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 1630
    },
    {
      "adult": false,
      "backdrop_path": "/zOpe0eHsq0A2NvNyBbtT6sj53qV.jpg",
      "genre_ids": [
        28,
        878,
        35,
        10751,
        12,
        14
      ],
      "id": 939243,
      "original_language": "en",
      "original_title": "Sonic the Hedgehog 3",
      "overview": "Sonic, Knuckles, and Tails reunite against a powerful new adversary, Shadow, a mysterious villain with powers unlike anything they have faced before. With their abilities outmatched in every way, Team Sonic must seek out an unlikely alliance in hopes of stopping Shadow and protecting the planet.",
      "popularity": 17.029,
      "poster_path": "/d8Ryb8AunYAuycVKDp5HpdWPKgC.jpg",
      "release_date": "2024-12-19",
      "title": "Sonic the Hedgehog 3",
      "video": false,
      "vote_average": 7.716,
      "vote_count": 2169
    },
    {
      "adult": false,
      "backdrop_path": "/9nhjGaFLKtddDPtPaX5EmKqsWdH.jpg",
      "genre_ids": [
        10749,
        878,
        53
      ],
      "id": 950396,
      "original_language": "en",
      "original_title": "The Gorge",
      "overview": "Two highly trained operatives grow close from a distance after being sent to guard opposite sides of a mysterious gorge. When an evil below emerges, they must work together to survive what lies within.",
      "popularity": 27.269,
      "poster_path": "/7iMBZzVZtG0oBug4TfqDb9ZxAOa.jpg",
      "release_date": "2025-02-13",
      "title": "The Gorge",
      "video": false,
      "vote_average": 7.78,
      "vote_count": 1914
    },
    {
      "adult": false,
      "backdrop_path": "/gKqeUlwYiZBDbFU5gT0ev7W3Vzs.jpg",
      "genre_ids": [
        53,
        35,
        27
      ],
      "id": 1013482,
      "original_language": "en",
      "original_title": "Borderline",
      "overview": "A helplessly romantic sociopath escapes from a mental institution and invades the home of a '90s pop superstar. He just wants to be loved; she just wants to survive.",
      "popularity": 25.005,
      "poster_path": "/z2yAWt1aAvhxap9mdjlQhXiEJT4.jpg",
      "release_date": "2025-03-14",
      "title": "Borderline",
      "video": false,
      "vote_average": 5,
      "vote_count": 6
    },
    {
      "adult": false,
      "backdrop_path": "/6J259Zuq09Bt2PLUNeTS5a3DwLZ.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 1212855,
      "original_language": "en",
      "original_title": "Fight or Flight",
      "overview": "A mercenary takes on the job of tracking down a target on a plane but must protect her when they're surrounded by people trying to kill both of them.",
      "popularity": 15.053,
      "poster_path": "/x4nWnfgJvL045rcUCSJzfgIIY9i.jpg",
      "release_date": "2025-03-13",
      "title": "Fight or Flight",
      "video": false,
      "vote_average": 6.4,
      "vote_count": 18
    },
    {
      "adult": false,
      "backdrop_path": "/ywe9S1cOyIhR5yWzK7511NuQ2YX.jpg",
      "genre_ids": [
        28,
        53,
        878
      ],
      "id": 822119,
      "original_language": "en",
      "original_title": "Captain America: Brave New World",
      "overview": "After meeting with newly elected U.S. President Thaddeus Ross, Sam finds himself in the middle of an international incident. He must discover the reason behind a nefarious global plot before the true mastermind has the entire world seeing red.",
      "popularity": 14.42,
      "poster_path": "/pzIddUEMWhWzfvLI3TwxUG2wGoi.jpg",
      "release_date": "2025-02-12",
      "title": "Captain America: Brave New World",
      "video": false,
      "vote_average": 6.17,
      "vote_count": 1018
    },
    {
      "adult": false,
      "backdrop_path": "/o4onk5Khih3vnZeHI2Rf2zyMWN6.jpg",
      "genre_ids": [
        28,
        80,
        53
      ],
      "id": 1149167,
      "original_language": "en",
      "original_title": "High Rollers",
      "overview": "Mason, a master thief, lives a dream life of riches with his crew and girlfriend Decker. When nemesis Salazar kidnaps Decker, Mason must attempt a high-stakes casino heist to save her, all while evading Salazar’s rivals and the FBI.",
      "popularity": 24.013,
      "poster_path": "/hHowAaChDjwueySmwVbsjHmpWa.jpg",
      "release_date": "2025-03-14",
      "title": "High Rollers",
      "video": false,
      "vote_average": 6.5,
      "vote_count": 4
    },
    {
      "adult": false,
      "backdrop_path": "/4HnBkc45h6ABO9i6rbPHTqlKUu8.jpg",
      "genre_ids": [
        18,
        80
      ],
      "id": 1013601,
      "original_language": "en",
      "original_title": "The Alto Knights",
      "overview": "Two of New York's most notorious organized crime bosses, Frank Costello and Vito Genovese, vie for control of the city's streets. Once the best of friends, petty jealousies and a series of betrayals place them on a deadly collision course that will reshape the Mafia (and America) forever.",
      "popularity": 23.418,
      "poster_path": "/83XlB51zRozwqpwB4YfCc0AvpTA.jpg",
      "release_date": "2025-03-14",
      "title": "The Alto Knights",
      "video": false,
      "vote_average": 0,
      "vote_count": 0
    },
    {
      "adult": false,
      "backdrop_path": "/a4H5TFw7p7hCzED5zKuNzjBbi5h.jpg",
      "genre_ids": [
        18,
        10402
      ],
      "id": 607141,
      "original_language": "hi",
      "original_title": "Be Happy",
      "overview": "A dance-drama film that follows a single father and his witty, wise-beyond-her-years daughter. When his daughter's dream of performing in the country's biggest dance reality show collides with a life-altering crisis, the father is driven to do the unthinkable, showcasing the extraordinary lengths he will go to fulfill her wishes and find happiness.",
      "popularity": 23.045,
      "poster_path": "/ugMPpC7EkY5caAZU4pAl2CYdfP0.jpg",
      "release_date": "2025-03-14",
      "title": "Be Happy",
      "video": false,
      "vote_average": 7,
      "vote_count": 1
    },
    {
      "adult": false,
      "backdrop_path": "/mAuqcQLRqliNatDF9R4a3dz7sss.jpg",
      "genre_ids": [
        18
      ],
      "id": 1171153,
      "original_language": "de",
      "original_title": "Köln 75",
      "overview": "Behind one of the best-selling jazz records of all time, Keith Jarrett’s 1975 Köln Concert, how it almost didn’t happen, and how one formidable German teenager, Vera Brandes, breaks every boundary to set the conditions for the creation of a masterpiece. Vera, still in high school when she started producing and promoting music concerts in Cologne, puts everything on the line to put on this show. But Vera believes in the power of music, and she’s never seen anyone play like Keith Jarrett before.",
      "popularity": 14.404,
      "poster_path": "/6ZvdCexhNarRsZVDShialfsK5lf.jpg",
      "release_date": "2025-03-13",
      "title": "Köln 75",
      "video": false,
      "vote_average": 9.2,
      "vote_count": 2
    },
    {
      "adult": false,
      "backdrop_path": "/eKUcoySFWU8BAWTYaLHcalg9KDR.jpg",
      "genre_ids": [
        18,
        10749,
        10402
      ],
      "id": 1182088,
      "original_language": "pt",
      "original_title": "O Melhor Amigo",
      "overview": "Two great friends meet again after five years. Among so many things that have changed, the resumption of the bond awakens an old feeling for which they remain unprepared.",
      "popularity": 13.741,
      "poster_path": "/dRzRvvQZE9XfGSTDm2rgolG6e3j.jpg",
      "release_date": "2025-03-13",
      "title": "The Best Friend",
      "video": false,
      "vote_average": 7,
      "vote_count": 2
    },
    {
      "adult": false,
      "backdrop_path": "/cKIH5oCwpAGqCdIrBDrohPJJkwb.jpg",
      "genre_ids": [
        18
      ],
      "id": 1043808,
      "original_language": "pt",
      "original_title": "Vitória",
      "overview": "Inspired by a real woman, who filmed for two years, hidden, the routine of drug dealers on Ladeira dos Tabajaras, in Copacabana, in 2004. At the time, the material was passed on to the police, who opened an investigation and carried out an operation that resulted in in the arrest of more than 30 people, including military police involved with the gang.",
      "popularity": 13.688,
      "poster_path": "/tiIwRMsmJnzXuCdPu38lCscgCS7.jpg",
      "release_date": "2025-03-13",
      "title": "Vitória",
      "video": false,
      "vote_average": 9,
      "vote_count": 3
    },
    {
      "adult": false,
      "backdrop_path": "/dci3b1dC8PX3P5ZXnO7v6mjRcpC.jpg",
      "genre_ids": [
        99
      ],
      "id": 1119820,
      "original_language": "he",
      "original_title": "The Return from the Other Planet",
      "overview": "In 1945, a few months after his release from Auschwitz, Yechiel De-Nur, still in his striped jacket, sat down and started writing. After two weeks, he was reborn as Ka-Tzetnik, “the man from the camps.” The books that he wrote were translated into 32 languages and sold millions, while the author himself hid behind the pseudonym Ka-Tzetnik. At the trial of Adolf Eichmann in 1961 his revelatory testimony revealed his true identity as he described Auschwitz as “the other planet,” a place outside of human judgment. Years later, undergoing an experimental LSD treatment for trauma, he revisits his experience, imagining himself as a SS officer, and that changes everything.",
      "popularity": 13.68,
      "poster_path": "/qaOhBUAJVpFl8zSCXX1qySsydcI.jpg",
      "release_date": "2025-03-13",
      "title": "The Return from the Other Planet",
      "video": false,
      "vote_average": 10,
      "vote_count": 1
    },
    {
      "adult": false,
      "backdrop_path": "/2r3b7XSYr9OfIaKyXmiaFNJc4oh.jpg",
      "genre_ids": [
        10749,
        18
      ],
      "id": 1127648,
      "original_language": "en",
      "original_title": "Bonjour Tristesse",
      "overview": "At the height of summer, 18-year-old Cécile (Lily McInerny) is relaxing by the French seaside with her father (Claes Bang) and falling in love with her new boyfriend. The arrival of her late mother’s enigmatic friend (Chloë Sevigny) turns her world upside down. A modern take on Françoise Sagan’s unforgettable coming-of-age novel. A Toronto International Film Festival premiere.",
      "popularity": 13.667,
      "poster_path": "/1yYSUbWs11mjl0s7bjRH8gywKQS.jpg",
      "release_date": "2025-03-13",
      "title": "Bonjour Tristesse",
      "video": false,
      "vote_average": 8,
      "vote_count": 1
    },
    {
      "adult": false,
      "backdrop_path": "/qkswMUEGRIiPIEf9hFnhPnUbXCN.jpg",
      "genre_ids": [
        53,
        18
      ],
      "id": 1130863,
      "original_language": "fr",
      "original_title": "Belle",
      "overview": "A couple have a peaceful existence in a small provincial town. He is a teacher and she runs an opticians practical. Their life is turned upside when Belle, a friend’s daughter who is lodging with them, is found dead in her room.  The husband becomes the prime suspect as the only one at home at the time.",
      "popularity": 13.665,
      "poster_path": "/5YITitG67kcHNUDJdP5XodlkTlm.jpg",
      "release_date": "2025-03-13",
      "title": "Belle",
      "video": false,
      "vote_average": 8,
      "vote_count": 1
    },
    {
      "adult": false,
      "backdrop_path": null,
      "genre_ids": [
        27,
        9648,
        53
      ],
      "id": 1306707,
      "original_language": "en",
      "original_title": "I Don't Like It Here",
      "overview": "A recently paroled outsider returns to his desolate hometown, only to find a community plagued by a disturbing darkness. As he grapples with his own past and the town’s sinister secrets, he becomes the prime suspect in a series of gruesome murders.",
      "popularity": 22.714,
      "poster_path": "/bdwrJZ0Ue9I3M8OsTP3FuFSbpB.jpg",
      "release_date": "2025-03-14",
      "title": "I Don't Like It Here",
      "video": false,
      "vote_average": 0,
      "vote_count": 0
    },
    {
      "adult": false,
      "backdrop_path": "/zySLhWnLLVsIswnbF3q5IlOLVW7.jpg",
      "genre_ids": [
        18,
        27,
        9648
      ],
      "id": 1429788,
      "original_language": "id",
      "original_title": "Samar",
      "overview": "After moving into her family's abandoned house, horror comic artist Ilmira struggles to complete her latest work while battling financial hardship. But when eerie figures from her past stories come to life—especially the haunting Hooded Woman—her reality spirals into a nightmare, forcing her to confront a buried childhood trauma.",
      "popularity": 13.622,
      "poster_path": "/waEYWR595cnmkr2OXFjasgGyZGt.jpg",
      "release_date": "2025-03-13",
      "title": "Nightmare",
      "video": false,
      "vote_average": 6.667,
      "vote_count": 3
    },
    {
      "adult": false,
      "backdrop_path": null,
      "genre_ids": [
        27,
        18
      ],
      "id": 1317096,
      "original_language": "th",
      "original_title": "มูลู หน้าครู",
      "overview": "May, a young architect who has just moved into her new house in the suburbs with her boyfriend Gun, got news of the death of her stepmother, Po. Only Noon, Po's daughter, testifies that someone killed her mother, however, there does not appear to be any clear evidence.  After May decided to take care Noon at her house, Noon has abnormal symptoms as if she had been possessed by a ghost. Whereas May herself, she began to have inability to sleep cause her illness. Gun then asked Chok, Sak and Master Khom to help.  Master Khom immediately realized that there were “black magic” from the past inside her house, he asked all to find the source of this evil. There is a misfortune in the past related to the The Master's Facial Skin which was removed by Master Jong who is another disciple from his same sect was the source of all these horrifying stories.",
      "popularity": 13.619,
      "poster_path": "/y1aTtWkMjgKgkNa6Zxs3kmxje21.jpg",
      "release_date": "2025-03-13",
      "title": "Mulu Nakru",
      "video": false,
      "vote_average": 8,
      "vote_count": 1
    }
  ],
  "total_pages": 49179,
  "total_results": 983570
}


*/
