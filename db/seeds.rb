roles = Role.create([
  {title: 'admin'},
  {title: 'user'}
]) if Role.count == 0

payments = Payment.create([
  {type_of_paiment: 'cash payment'}
]) if Payment.count == 0

colors = Color.create([
  {title: 'Silver'},
  {title: 'Black'},
  {title: 'Dark Black'},
  {title: 'Red'}
]) if Color.count == 0

sizes = Size.create([
  {title: 'L'},
  {title: 'XL'},
  {title: 'S'},
  {title: 'M'}
]) if Size.count == 0

genders = Gender.all
genders.each do |g|
  g.destroy
end

gender_man = Gender.create(title: 'man').id
gender_woman = Gender.create(title: 'woman').id
Gender.create(title: 'woman and man')

slider_products = SliderProduct.all
slider_products.each do |s|
  s.destroy
end

carousel_products = CarouselProduct.all
carousel_products.each do |c|
  c.destroy
end

best_sellers = BestSeller.all
best_sellers.each do |b|
  b.destroy
end

orders = Order.all
orders.each do |o|
  o.destroy
end

users = User.all
users.each do |u|
  u.destroy
end

products = Product.all
products.each do |p|
  p.destroy
end

brands = Brand.all
brands.each do |b|
  b.destroy
end

categories = Category.all
categories.each do |c|
  c.destroy
end

description_brand = '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor 
incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit,
 sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, 
consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
 Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore 
et dolore magna aliqua.</p>'

brands_men = []
brands_men << Brand.create(title: 'Hugo Boss', description: '<h3>Hugo Boss</h3>' + description_brand,
                           gender_id: gender_man)

brands_men << Brand.create(title: 'Louis Vuitton', description: '<h3>Louis Vuitton</h3>' + description_brand,
                           gender_id: gender_man)
brands_men << Brand.create(title: 'Brooks Brothers', description: '<h3>Brooks Brothers</h3>' + description_brand,
                           gender_id: gender_man)
brands_men << Brand.create(title: 'Christian Dior S.A.', description: '<h3>Christian Dior S.A.</h3>' + description_brand,
                           gender_id: gender_man)
brands_men << Brand.create(title: 'Marc Jacobs', description: '<h3>Marc Jacobs</h3>' + description_brand,
                           gender_id: gender_man)
brands_men << Brand.create(title: 'Wrangler', description: '<h3>Wrangler</h3>' + description_brand,
                           gender_id: gender_man)
brands_men << Brand.create(title: 'Dolce & Gabbana', description: '<h3>Dolce & Gabbana</h3>' + description_brand,
                           gender_id: gender_man)
brands_men << Brand.create(title: 'French Connection', description: '<h3>French Connection</h3>' + description_brand,
                           gender_id: gender_man)

brands_men << Brand.create(title: 'Hollister.', description: '<h3>Hollister</h3>' + description_brand,
                           gender_id: gender_man)

brands_women = []
brands_women << Brand.create(title: 'Kate Spade', description: '<h3>Kate Spade</h3>' + description_brand,
                           gender_id: gender_woman)
brands_women << Brand.create(title: 'Badgley Mischka', description: '<h3>Badgley Mischka</h3>' + description_brand,
                           gender_id: gender_woman)
brands_women << Brand.create(title: 'Betsey Johnson LLC', description: '<h3>Betsey Johnson LLC</h3>' + description_brand,
                           gender_id: gender_woman)
brands_women << Brand.create(title: 'John Galliano', description: '<h3>John Galliano</h3>' + description_brand,
                           gender_id: gender_woman)
brands_women << Brand.create(title: 'Nicole Miller', description: '<h3>Nicole Miller</h3>' + description_brand,
                           gender_id: gender_woman)
brands_women << Brand.create(title: 'Victoria\'s Secret', description: '<h3>Victoria\'s Secret</h3>' + description_brand,
                           gender_id: gender_woman)
brands_women << Brand.create(title: 'Karl Lagerfeld', description: '<h3>Karl Lagerfeld</h3>' + description_brand,
                           gender_id: gender_woman)
brands_women << Brand.create(title: 'Roberto Cavalli', description: '<h3>Roberto Cavalli</h3>' + description_brand,
                           gender_id: gender_woman)

brands_women << Brand.create(title: 'Roberto', description: '<h3>Roberto</h3>' + description_brand,
                           gender_id: gender_woman)

categories = []
categories << Category.create(title: "Men's Outerwear")
categories << Category.create(title: "Men's Shirts")
categories << Category.create(title: "Men's Shoes")

categories << Category.create(title: "Women's Outerwear")
categories << Category.create(title: "Women's Dresses")


description_product = '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
<ul>
<li>Material: Cotton, Polyester</li>
<li>Clothing Length: Regular</li>
<li>Sleeve Length: Full</li>
<li>Style: Fashion</li>
<li>Weight: 0.477KG</li>
<li>Package Contents: 1 x Hoodie</li>       </ul>'

def add_photo product_photos, photo, photo_small
  product_photos.create(orig: photo, large: photo, small: photo_small)
  product_photos.create(orig: photo, large: photo, small: photo_small)
  product_photos.create(orig: photo, large: photo, small: photo_small)
  product_photos.create(orig: photo, large: photo, small: photo_small)
  product_photos.create(orig: photo, large: photo, small: photo_small)
end

def brand_id n, brands, i
  n == 2 ? brands[8].id : brands[i].id
end
# Outerwear Men
1.upto(2) do |n|
  # First Outerwear
  product = Product.create(name: 'Double Breasted Pocket Hemming Slimming Hooded',
                           category_id: categories[0].id, brand_id: brand_id(n, brands_men, 0), 
                           price: 54 * n, photo: 'outerwear_small_1.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_1.jpg', 'outerwear_small_1.jpg'

  product = Product.create(name: 'Turn-Down Collar Double-Breasted Long Sleeve',
                           category_id: categories[0].id, brand_id: brand_id(n, brands_men, 0), 
                           price: 25 * n, photo: 'outerwear_small_2.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_2.jpg', 'outerwear_small_2.jpg'
  if n == 1
    CarouselProduct.create(product_id: product.id, photo: 'c-outerwear_2.png', title: 'Double-Breasted')
    SliderProduct.create(product_id: product.id, photo: 's_outerwear_2.png',
                         title: 'Double-Breasted', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
  end

  product = Product.create(name: 'Laconic Stand Collar Patch Pocket Solid Color Slimming',
                           category_id: categories[0].id, brand_id: brand_id(n, brands_men, 1), 
                           price: 36 * n, photo: 'outerwear_small_3.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_3.jpg', 'outerwear_small_3.jpg'
  if n == 1
    BestSeller.create(product_id: product.id, quantity: 11)
    CarouselProduct.create(product_id: product.id, photo: 'c-outerwear_3.png', title: 'Laconic Stand Collar')
  end

  product = Product.create(name: 'Slimming Drawstring Wool Collar Multi-Button Flap Pocket',
                           category_id: categories[0].id, brand_id: brand_id(n, brands_men, 1), 
                           price: 85 * n, photo: 'outerwear_small_4.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_4.jpg', 'outerwear_small_4.jpg'

  product = Product.create(name: 'Color Block Multi-Zipper Stereo Patch Pocket',
                           category_id: categories[0].id, brand_id: brand_id(n, brands_men, 2), 
                           price: 45 * n, photo: 'outerwear_small_5.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_5.jpg', 'outerwear_small_5.jpg'
  if n == 1
    BestSeller.create(product_id: product.id, quantity: 10)
    CarouselProduct.create(product_id: product.id, photo: 'c-outerwear_5.png', title: 'Color Block Multi-Zipper')
  end

  product = Product.create(name: 'Slimming Rib Spliced Button and Epaulet Design Stand Collar',
                           category_id: categories[0].id, brand_id: brand_id(n, brands_men, 2), 
                           price: 64 * n, photo: 'outerwear_small_6.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_6.jpg', 'outerwear_small_6.jpg'


  #Second Outerwear
  product = Product.create(name: 'Slimming Rib Spliced Button and Epaulet Design Stand Collar',
                           category_id: categories[0].id, brand_id: brands_men[8].id, 
                           price: 40 * n, photo: 'outerwear_small_6.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_6.jpg', 'outerwear_small_6.jpg'

  product = Product.create(name: 'Color Block Multi-Zipper Stereo Patch Pocket',
                           category_id: categories[0].id, brand_id: brands_men[8].id, 
                           price: 26 * n, photo: 'outerwear_small_5.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_5.jpg', 'outerwear_small_5.jpg'

  product = Product.create(name: 'Slimming Drawstring Wool Collar Multi-Button Flap Pocket',
                           category_id: categories[0].id, brand_id: brands_men[8].id, 
                           price: 25 * n, photo: 'outerwear_small_4.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_4.jpg', 'outerwear_small_4.jpg'

  product = Product.create(name: 'Turn-Down Collar Double-Breasted Long Sleeve',
                           category_id: categories[0].id, brand_id: brands_men[8].id, 
                           price: 22 * n, photo: 'outerwear_small_2.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_2.jpg', 'outerwear_small_2.jpg'

  product = Product.create(name: 'Double Breasted Pocket Hemming Slimming Hooded',
                           category_id: categories[0].id, brand_id: brands_men[8].id, 
                           price: 20 * n, photo: 'outerwear_small_1.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_1.jpg', 'outerwear_small_1.jpg'

  product = Product.create(name: 'Laconic Stand Collar Patch Pocket Solid Color Slimming',
                           category_id: categories[0].id, brand_id: brands_men[8].id, 
                           price: 31 * n, photo: 'outerwear_small_3.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_3.jpg', 'outerwear_small_3.jpg'
end

# Outerwear Women
1.upto(2) do |n|
  # First Outerwear
  product = Product.create(name: 'Stylish Convertible Collar Long Sleeve Solid Color Zippered',
                           category_id: categories[3].id, brand_id: brand_id(n, brands_women, 0), 
                           price: 54 * n, photo: 'outerwear_small_7.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_7.png', 'outerwear_small_7.jpg'
  if n == 1
    SliderProduct.create(product_id: product.id, photo: 's_outerwear_7.png',
                         title: 'Stylish Convertible Collar', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
  end

  product = Product.create(name: 'Stylish Fleece Lined Long Sleeve Hooded',
                           category_id: categories[3].id, brand_id: brand_id(n, brands_women, 1), 
                           price: 25 * n, photo: 'outerwear_small_8.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_8.jpg', 'outerwear_small_8.jpg'

  product = Product.create(name: 'Stylish Hooded Long Sleeve Solid Color PU',
                           category_id: categories[3].id, brand_id: brand_id(n, brands_women, 2), 
                           price: 36 * n, photo: 'outerwear_small_9.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_9.jpg', 'outerwear_small_9.jpg'
  if n == 1
    BestSeller.create(product_id: product.id, quantity: 7)
  end

  product = Product.create(name: 'Chic Women\'s Belt Long Sleeve Winter',
                           category_id: categories[3].id, brand_id: brand_id(n, brands_women, 3), 
                           price: 85 * n, photo: 'outerwear_small_10.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_10.png', 'outerwear_small_10.jpg'

  product = Product.create(name: 'Stylish Turn-Down Neck Long Sleeve Spliced',
                           category_id: categories[3].id, brand_id: brand_id(n, brands_women, 4), 
                           price: 45 * n, photo: 'outerwear_small_11.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_11.jpg', 'outerwear_small_11.jpg'

  if n == 1
    BestSeller.create(product_id: product.id, quantity: 6)
    CarouselProduct.create(product_id: product.id, photo: 'c-outerwear_11.png', title: 'Stylish Turn-Down')
  end

  product = Product.create(name: 'Sweet Hooded Batwing Sleeve Wool For Women',
                           category_id: categories[3].id, brand_id: brand_id(n, brands_women, 5), 
                           price: 64 * n, photo: 'outerwear_small_12.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_12.jpg', 'outerwear_small_12.jpg'


  #Second Outerwear
  product = Product.create(name: 'Sweet Hooded Batwing Sleeve Wool For Women',
                           category_id: categories[3].id, brand_id: brands_women[8].id, 
                           price: 40 * n, photo: 'outerwear_small_12.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_12.jpg', 'outerwear_small_12.jpg'

  product = Product.create(name: 'Stylish Turn-Down Neck Long Sleeve Spliced',
                           category_id: categories[3].id, brand_id: brands_women[8].id, 
                           price: 26 * n, photo: 'outerwear_small_11.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_11.jpg', 'outerwear_small_11.jpg'

  product = Product.create(name: 'Chic Women\'s Belt Long Sleeve Winter',
                           category_id: categories[3].id, brand_id: brand_id(n, brands_women, 7), 
                           price: 25 * n, photo: 'outerwear_small_10.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_10.png', 'outerwear_small_10.jpg'

  product = Product.create(name: 'Stylish Fleece Lined Long Sleeve Hooded',
                           category_id: categories[3].id, brand_id: brand_id(n, brands_women, 6), 
                           price: 22 * n, photo: 'outerwear_small_8.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_8.jpg', 'outerwear_small_8.jpg'

  product = Product.create(name: 'Stylish Convertible Collar Long Sleeve Solid Color Zippered',
                           category_id: categories[3].id, brand_id: brand_id(n, brands_women, 5), 
                           price: 20 * n, photo: 'outerwear_small_7.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_7.png', 'outerwear_small_7.jpg'

  product = Product.create(name: 'Stylish Hooded Long Sleeve Solid Color PU',
                           category_id: categories[3].id, brand_id: brand_id(n, brands_women, 4), 
                           price: 31 * n, photo: 'outerwear_small_9.jpg',
                           description: description_product)

  add_photo product.photos, 'outerwear_9.jpg', 'outerwear_small_9.jpg'
end


# Shirts Men
1.upto(2) do |n|
  # First Shirts
  product = Product.create(name: 'Vogue Shirt Collar Abstract Totem Print Color Block Slimming',
                           category_id: categories[1].id, brand_id: brand_id(n, brands_men, 3), 
                           price: 54 * n, photo: 'shirts_small_1.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_1.jpg', 'shirts_small_1.jpg'
  if n == 1
    CarouselProduct.create(product_id: product.id, photo: 'c-shirts_1.png', title: 'Vogue Shirt Abstract')
    SliderProduct.create(product_id: product.id, photo: 's_shirts_1.png',
                         title: 'Vogue Shirt Abstract', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
  end

  product = Product.create(name: 'Modern Style Shirt Collar Color Block Totem Print Spliced',
                           category_id: categories[1].id, brand_id: brand_id(n, brands_men, 3), 
                           price: 54 * n, photo: 'shirts_small_2.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_2.jpg', 'shirts_small_2.jpg'
  if n == 1
    BestSeller.create(product_id: product.id, quantity: 13)
  end
  product = Product.create(name: 'Slimming Trendy Turn-down Collar Checked Print Splicing',
                           category_id: categories[1].id, brand_id: brand_id(n, brands_men, 4), 
                           price: 54 * n, photo: 'shirts_small_3.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_3.jpg', 'shirts_small_3.jpg'

  product = Product.create(name: 'Letter and Badge Print Shirt Collar Long Sleeve Slimming',
                           category_id: categories[1].id, brand_id: brand_id(n, brands_men, 4), 
                           price: 54 * n, photo: 'shirts_small_4.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_4.jpg', 'shirts_small_4.jpg'

  product = Product.create(name: 'Turn-Down Collar Star Pattern Lining Long Sleeve',
                           category_id: categories[1].id, brand_id: brand_id(n, brands_men, 5), 
                           price: 54 * n, photo: 'shirts_small_5.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_5.jpg', 'shirts_small_5.jpg'
  if n == 1
    BestSeller.create(product_id: product.id, quantity: 14)
    CarouselProduct.create(product_id: product.id, photo: 'c-shirts_5.png', title: 'Turn-Down Collar Star')
  end

  product = Product.create(name: 'Special Back Colorized Stripes Spliced One Patch Pocket',
                           category_id: categories[1].id, brand_id: brand_id(n, brands_men, 5), 
                           price: 54 * n, photo: 'shirts_small_6.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_6.jpg', 'shirts_small_6.jpg'


  #Second Shirts
  product = Product.create(name: 'Turn-Down Collar Star Pattern Lining Long Sleeve',
                           category_id: categories[1].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shirts_small_5.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_5.jpg', 'shirts_small_5.jpg'

  product = Product.create(name: 'Letter and Badge Print Shirt Collar Long Sleeve Slimming',
                           category_id: categories[1].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shirts_small_4.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_4.jpg', 'shirts_small_4.jpg'

  product = Product.create(name: 'Special Back Colorized Stripes Spliced One Patch Pocket',
                           category_id: categories[1].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shirts_small_6.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_6.jpg', 'shirts_small_6.jpg'

  product = Product.create(name: 'Slimming Trendy Turn-down Collar Checked Print Splicing',
                           category_id: categories[1].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shirts_small_3.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_3.jpg', 'shirts_small_3.jpg'

  product = Product.create(name: 'Vogue Shirt Collar Abstract Totem Print Color Block Slimming',
                           category_id: categories[1].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shirts_small_1.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_1.jpg', 'shirts_small_1.jpg'

  product = Product.create(name: 'Modern Style Shirt Collar Color Block Totem Print Spliced',
                           category_id: categories[1].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shirts_small_2.jpg',
                           description: description_product)

  add_photo product.photos, 'shirts_2.jpg', 'shirts_small_2.jpg'
end


# Shoes Men
1.upto(2) do |n|
  # First Shoes
  product = Product.create(name: 'Preppy Style Men\'s Athletic Shoes With Color Block and Lace-Up Design',
                           category_id: categories[2].id, brand_id: brand_id(n, brands_men, 6), 
                           price: 54 * n, photo: 'shoes_small_1.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_1.jpg', 'shoes_small_1.jpg'
  if n == 1
    CarouselProduct.create(product_id: product.id, photo: 'c-shoes_2.png', title: 'Athletic Shoes')
  end

  product = Product.create(name: 'Fashionable Men\'s Athletic Shoes With Color Matching',
                           category_id: categories[2].id, brand_id: brand_id(n, brands_men, 6), 
                           price: 54 * n, photo: 'shoes_small_2.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_2.jpg', 'shoes_small_2.jpg'
  if n == 1
    BestSeller.create(product_id: product.id, quantity: 9)
  end

  product = Product.create(name: 'Stylish Men\'s Formals Shoes With Stone Pattern',
                           category_id: categories[2].id, brand_id: brand_id(n, brands_men, 7), 
                           price: 54 * n, photo: 'shoes_small_3.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_3.jpg', 'shoes_small_3.jpg'

  product = Product.create(name: 'Stylish Men\'s Formal Shoes With Crocodile Print',
                           category_id: categories[2].id, brand_id: brand_id(n, brands_men, 7), 
                           price: 54 * n, photo: 'shoes_small_4.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_4.jpg', 'shoes_small_4.jpg'

  product = Product.create(name: 'Trendy Men\'s Athletic Shoes With Color Block',
                           category_id: categories[2].id, brand_id: brand_id(n, brands_men, 0), 
                           price: 54 * n, photo: 'shoes_small_5.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_5.jpg', 'shoes_small_5.jpg'
  if n == 1
    BestSeller.create(product_id: product.id, quantity: 8)
  end

  product = Product.create(name: 'Trendy Men\'s Boots With Embroidery and Stitching Design',
                           category_id: categories[2].id, brand_id: brand_id(n, brands_men, 1), 
                           price: 54 * n, photo: 'shoes_small_6.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_6.jpg', 'shoes_small_6.jpg'

  #Second Shoes
  product = Product.create(name: 'Trendy Men\'s Athletic Shoes With Color Block',
                           category_id: categories[2].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shoes_small_5.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_5.jpg', 'shoes_small_5.jpg'

  product = Product.create(name: 'Stylish Men\'s Formal Shoes With Crocodile Print',
                           category_id: categories[2].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shoes_small_4.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_4.jpg', 'shoes_small_4.jpg'

  product = Product.create(name: 'Trendy Men\'s Boots With Embroidery and Stitching Design',
                           category_id: categories[2].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shoes_small_6.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_6.jpg', 'shoes_small_6.jpg'

  product = Product.create(name: 'Stylish Men\'s Formals Shoes With Stone Pattern',
                           category_id: categories[2].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shoes_small_3.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_3.jpg', 'shoes_small_3.jpg'

  product = Product.create(name: 'Preppy Style Men\'s Athletic Shoes With Color Block and Lace-Up Design',
                           category_id: categories[2].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shoes_small_1.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_1.jpg', 'shoes_small_1.jpg'

  product = Product.create(name: 'Fashionable Men\'s Athletic Shoes With Color Matching',
                           category_id: categories[2].id, brand_id: brands_men[8].id, 
                           price: 54 * n, photo: 'shoes_small_2.jpg',
                           description: description_product)

  add_photo product.photos, 'shoes_2.jpg', 'shoes_small_2.jpg'
end


# Dresses Women
1.upto(2) do |n|
  # First Dresses
  product = Product.create(name: 'Fashionable Cap Sleeve Round Collar Lace A-Line',
                           category_id: categories[4].id, brand_id: brand_id(n, brands_women, 6), 
                           price: 54 * n, photo: 'dresses_small_1.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_1.jpg', 'dresses_small_1.jpg'

  product = Product.create(name: 'Retro Women\'s Sweetheart Neck Solid Color Sleeveless Dress',
                           category_id: categories[4].id, brand_id: brand_id(n, brands_women, 7), 
                           price: 54 * n, photo: 'dresses_small_2.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_2.jpg', 'dresses_small_2.jpg'

  product = Product.create(name: 'Vintage Scoop Collar Short Sleeve Pure Color Cut Out Lace',
                           category_id: categories[4].id, brand_id: brand_id(n, brands_women, 0), 
                           price: 54 * n, photo: 'dresses_small_3.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_3.jpg', 'dresses_small_3.jpg'
  if n == 1
    BestSeller.create(product_id: product.id, quantity: 15)
  end

  product = Product.create(name: 'Vintage Turn-Down Collar Sleeveless Solid Color Bowknot',
                           category_id: categories[4].id, brand_id: brand_id(n, brands_women, 1), 
                           price: 54 * n, photo: 'dresses_small_4.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_4.jpg', 'dresses_small_4.jpg'

  if n == 1
    SliderProduct.create(product_id: product.id, photo: 's_dresses_4.png',
                         title: 'Vintage Turn-Down Collar', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
  end

  product = Product.create(name: 'Vintage Turn-Down Collar Sleeveless Solid Color Bowknot',
                           category_id: categories[4].id, brand_id: brand_id(n, brands_women, 2), 
                           price: 54 * n, photo: 'dresses_small_5.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_5.jpg', 'dresses_small_5.jpg'
  if n == 1
    BestSeller.create(product_id: product.id, quantity: 5)
  end

  product = Product.create(name: 'Solid Color Backless Elegant Sweetheart Neck Sleeveless',
                           category_id: categories[4].id, brand_id: brand_id(n, brands_women, 3), 
                           price: 54 * n, photo: 'dresses_small_6.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_6.png', 'dresses_small_6.jpg'

  #Second Shoes
  product = Product.create(name: 'Solid Color Backless Elegant Sweetheart Neck Sleeveless',
                           category_id: categories[4].id, brand_id: brands_women[8].id, 
                           price: 54 * n, photo: 'dresses_small_6.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_6.png', 'dresses_small_6.jpg'

  product = Product.create(name: 'Vintage Turn-Down Collar Sleeveless Solid Color Bowknot',
                           category_id: categories[4].id, brand_id: brands_women[8].id, 
                           price: 54 * n, photo: 'dresses_small_4.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_4.jpg', 'dresses_small_4.jpg'

  product = Product.create(name: 'Vintage Turn-Down Collar Sleeveless Solid Color Bowknot',
                           category_id: categories[4].id, brand_id: brands_women[8].id, 
                           price: 54 * n, photo: 'dresses_small_5.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_5.jpg', 'dresses_small_5.jpg'

  product = Product.create(name: 'Vintage Scoop Collar Short Sleeve Pure Color Cut Out Lace',
                           category_id: categories[4].id, brand_id: brands_women[8].id, 
                           price: 54 * n, photo: 'dresses_small_3.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_3.jpg', 'dresses_small_3.jpg'

  product = Product.create(name: 'Fashionable Cap Sleeve Round Collar Lace A-Line',
                           category_id: categories[4].id, brand_id: brands_women[8].id, 
                           price: 54 * n, photo: 'dresses_small_1.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_1.jpg', 'dresses_small_1.jpg'

  product = Product.create(name: 'Retro Women\'s Sweetheart Neck Solid Color Sleeveless Dress',
                           category_id: categories[4].id, brand_id: brands_women[8].id, 
                           price: 54 * n, photo: 'dresses_small_2.jpg',
                           description: description_product)

  add_photo product.photos, 'dresses_2.jpg', 'dresses_small_2.jpg'
end

