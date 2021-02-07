
betty = User.create(username: "betty", email: betty@gmail.com, password: "password", seed_phrase: "patty")
martha = User.create(username: "martha", email: martha@yahoo.com, password: "password!", seed_phrase: "heye")
melat = User.create(username: "melat", email: melat@email.com, password: "password!!", seed_phrase: "cali")

recy = Action.create(name: "recycle", title: "it is not hard to do", description: "recycled boxes", image: nil, 
       fact: "Recycling not only keeps rubbish away from our parks and beaches but also prevents dangerous materials from contaminating the environment.", user: betty)

plan = Action.create(name: "planting", title: "tree planting", description: "planting two trees per day", image: nil, 
       fact: "An average size tree produces enough oxygen in one year to keep a family of four breathing.", user: martha)

walk = Action.create(name: "walking", title: "let us walk to protect environment", description: "walking to work instead of using a car", image: nil, 
       fact: "walking over other modes of transportation (such as a car), we reduce the number of harmful emissions created and released into the atmosphere.", user: melat)
    
SavedAction.create(user: betty, action: recy)
SavedAction.create(user: martha, action: plan)
SavedAction.create(user: melat, action: walk)




