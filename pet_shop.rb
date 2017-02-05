
def pet_shop_name(hash)
  return hash[:name]
end


def total_cash(hash)
  return hash[:admin][:total_cash]
end


def add_or_remove_cash(hash,cash)
  current = hash[:admin][:total_cash]
  change = cash
  total = ( current + change ).to_i
  hash[:admin][:total_cash] = total
  return hash[:admin][:total_cash]
end


def pets_sold(shop)
  return shop[:admin][:pets_sold]
end


def change_pets_sold(shop,number)
  current = (shop[:admin][:pets_sold]).to_i
  addition = number.to_i
  newvalue = (current + addition).to_i
  shop[:admin][:pets_sold] = newvalue
  return shop[:admin][:pets_sold]
end  


def stock_count(shop)
 #Because the pets stocked are an array, if we return the final index of the final item and add one, we will have the number of pets in the shop.
 #We could pass a test expecting 'six' by making it display something to do with the final pet's name, but 
 #nevermind, there's a function for this already.
  return shop[:pets].count
end


def pets_by_breed(shop,breed)
  petsofbreed = Array.new
    for pet in shop[:pets]
      if pet[:breed] == breed.to_s
        petsofbreed << pet
      end
    end
  return petsofbreed
end
#received help from Darren on this: I had been using .include? in shop[:pets][:breed], not realising I'd already been going through the pets hash.


def find_pet_by_name(shop,petname)
  for pet in shop[:pets]
    if pet[:name] == petname.to_s
      return pet
    end
  end
  pet = nil
end


def remove_pet_by_name(shop,petname)
  for pet in shop[:pets]
    if pet[:name] == petname.to_s
      shop[:pets].delete(pet)
    end 
  end
end


def add_pet_to_stock(shop,newpet)
  shop[:pets].push(newpet)
end


def customer_pet_count(arrayinput)
  arrayinput[:pets].count
end


def add_pet_to_customer(customer,newpet)
  customer[:pets].push(newpet)
end


def customer_can_afford_pet(customerinput,putativepet)
  if customerinput[:cash] > putativepet[:price] == true
     return true
  else
      return false
  end
end


def sell_pet_to_customer(shop,newpet,customer)
  for pet in shop[:pets]
    if pet[:name] == newpet[:name]
      petprice = (pet[:price])
      customer[:cash] -= petprice
      add_or_remove_cash(shop,petprice)
      add_pet_to_customer(customer,newpet)
      remove_pet_by_name(shop,newpet)
      change_pets_sold(shop,1)
    end
  end
end