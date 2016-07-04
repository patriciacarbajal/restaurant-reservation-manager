restaurants = Restaurant.create([{ name: 'Sushi Restaurant', phone: '212-123-4567', address: '12 Main St', open_time: '11:00:00' , closing_time: '23:59:00', capacity: 100, description: "The best sushi in the city!" },
                                 { name: 'Steakhouse', phone: '212-321-7654', address: '100 Broadway', open_time: '17:00:00' , closing_time: '23:59:00', capacity: 50, description: "Come enjoy a perfectly cooked filet mignon!" }])

admin = Customer.create(name: 'admin', email: 'admin@admin.com', password: 'admin', password_confirmation: 'admin', phone: '212-222-2222', account_type:'admin')
