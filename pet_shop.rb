def pet_shop_name(hash)
  return hash[:name]
end

def total_cash(hash)
  return hash[:admin][:total_cash]
end

def add_or_remove_cash(hash,cash)
#We want to add or remove cash to hash[:admin][:total_cash].
#How to reference an item's location in the equ
  current = hash[:admin][:total_cash]
  change = cash
  total = ( current + change ).to_i
  hash[:admin][:total_cash] = total
  return hash[:admin][:total_cash]
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end