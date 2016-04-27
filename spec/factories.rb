FactoryGirl.define do

  factory :registered_user, class: User do
  	email 						      "registered_user@example.com"
    first_name 					    "John"
    last_name  					    "Doe"
    password					      "password"
    password_confirmation		"password"
    confirmed_at 				    "2016-04-26 00:48:31"
    role                    "admin"
  end

  factory :unregistered_user, class: User do
  	email 						       "unregistered_user@example.com"
    first_name 					      "John"
    last_name  					      "Doe"
    password					        "password"
    password_confirmation		  "password"
  end

  factory :invalid_user, class: User do
    email                   "registered_user@example.com"
    first_name              "John"
    last_name               "Doe"
    password                "password"
    password_confirmation   "password"
    confirmed_at            "2016-04-26 00:48:31"
  end

    factory :admin_user, class: User do
    email                   "admin_user@example.com"
    first_name              "John"
    last_name               "Doe"
    password                "password"
    password_confirmation   "password"
    confirmed_at            "2016-04-26 00:48:31"
    role                    "admin"
  end
    factory :cancan_user, class: User do
    email                   "cancan_user@example.com"
    first_name              "John"
    last_name               "Doe"
    password                "password"
    password_confirmation   "password"
    confirmed_at            "2016-04-26 00:48:31"
    role                    "admin"
  end

  factory :slc_user, class: User do
    email                   "slc_user@example.com"
    first_name              "John"
    last_name               "Doe"
    password                "password"
    password_confirmation   "password"
    confirmed_at            "2016-04-26 00:48:31"
    role                    "slc"
  end


  factory :shift, class: Shift do
    start_time            "2016-04-27 05:12:00"
    end_time              "2016-04-27 12:12:00"
    department            "Floor 1"
    association :user, factory: :assoc_user
  end

    factory :assoc_user, :class => 'User' do |f|
    ## assign fields
    email                   "assoc_user@example.com"
    first_name              "John"
    last_name               "Doe"
    password                "password"
    password_confirmation   "password"
    confirmed_at            "2016-04-26 00:48:31"
    role                    "admin"
  end

end