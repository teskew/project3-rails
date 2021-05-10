{username: "h_annah",  password: "test",email: "h_annah@123.com"  },
    {username: "A_manda",  password: "test", email: "A_manda@123.com" },
    {username: "e_lombardo",  password: "test", email: "e_lombardo@123.com", }
    ])
Company.create([
    {company_name: "Ravinia", address: "2601_W_Diversity_Chicago"  },
    {company_name: "Symylie", address: "5435_N_Walcote_Ave_Chicago"  },
    {company_name: "Half_Acre", address: "4257_N_Lincoline_Ave_Chicago" }
    ])
Order.create([
        {beer_name: "Pony", description: "local",  quantity: "1000", user_id: 1, company_id: 1 },
        {beer_name: "Fader", description: "local",  quantity: "500", user_id: 2, company_id: 2,  }, 
          {beer_name: "Discuss", description: "local",  quantity: "100", user_id: 1, company_id: 1,  },
        ])