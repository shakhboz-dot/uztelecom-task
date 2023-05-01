const String userRepositories = r'''
  query MyProfile{
    get_user_profile{
      user_id
      updated_at
      subdivision_id
      position
      phone_number
      location_json
      last_name
      id
      first_name
      father_name
      created_at
      user{
        role
        car{
          id,
          number,
          color{
              name
              rgb
              hex
            }
          car_model{
              name
            }
        }
      }
 
    }
  }
''';
