CREATE TABLE `pizza_types` (
    `pizza_type_id`	VARCHAR(512),
    `name`	VARCHAR(512),
    `category`	VARCHAR(512),
    `ingredients`	VARCHAR(512),
    PRIMARY KEY (`pizza_type_id`)
);

INSERT INTO `pizza_types` (`pizza_type_id`, `name`, `category`, `ingredients`) VALUES
    ('bbq_ckn', 'The Barbecue Chicken Pizza', 'Chicken', 'Barbecued Chicken, Red Peppers, Green Peppers, Tomatoes, Red Onions, Barbecue Sauce'),
    ('cali_ckn', 'The California Chicken Pizza', 'Chicken', 'Chicken, Artichoke, Spinach, Garlic, Jalapeno Peppers, Fontina Cheese, Gouda Cheese'),
    ('ckn_alfredo', 'The Chicken Alfredo Pizza', 'Chicken', 'Chicken, Red Onions, Red Peppers, Mushrooms, Asiago Cheese, Alfredo Sauce'),
    ('ckn_pesto', 'The Chicken Pesto Pizza', 'Chicken', 'Chicken, Tomatoes, Red Peppers, Spinach, Garlic, Pesto Sauce'),
    ('southw_ckn', 'The Southwest Chicken Pizza', 'Chicken', 'Chicken, Tomatoes, Red Peppers, Red Onions, Jalapeno Peppers, Corn, Cilantro, Chipotle Sauce'),
    ('thai_ckn', 'The Thai Chicken Pizza', 'Chicken', 'Chicken, Pineapple, Tomatoes, Red Peppers, Thai Sweet Chilli Sauce'),
    ('big_meat', 'The Big Meat Pizza', 'Classic', 'Bacon, Pepperoni, Italian Sausage, Chorizo Sausage'),
    ('classic_dlx', 'The Classic Deluxe Pizza', 'Classic', 'Pepperoni, Mushrooms, Red Onions, Red Peppers, Bacon'),
    ('hawaiian', 'The Hawaiian Pizza', 'Classic', 'Sliced Ham, Pineapple, Mozzarella Cheese'),
    ('ital_cpcllo', 'The Italian Capocollo Pizza', 'Classic', 'Capocollo, Red Peppers, Tomatoes, Goat Cheese, Garlic, Oregano'),
    ('napolitana', 'The Napolitana Pizza', 'Classic', 'Tomatoes, Anchovies, Green Olives, Red Onions, Garlic'),
    ('pep_msh_pep', 'The Pepperoni, Mushroom, and Peppers Pizza', 'Classic', 'Pepperoni, Mushrooms, Green Peppers'),
    ('pepperoni', 'The Pepperoni Pizza', 'Classic', 'Mozzarella Cheese, Pepperoni'),
    ('the_greek', 'The Greek Pizza', 'Classic', 'Kalamata Olives, Feta Cheese, Tomatoes, Garlic, Beef Chuck Roast, Red Onions'),
    ('brie_carre', 'The Brie Carre Pizza', 'Supreme', 'Brie Carre Cheese, Prosciutto, Caramelized Onions, Pears, Thyme, Garlic'),
    ('calabrese', 'The Calabrese Pizza', 'Supreme', '�Nduja Salami, Pancetta, Tomatoes, Red Onions, Friggitello Peppers, Garlic'),
    ('ital_supr', 'The Italian Supreme Pizza', 'Supreme', 'Calabrese Salami, Capocollo, Tomatoes, Red Onions, Green Olives, Garlic'),
    ('peppr_salami', 'The Pepper Salami Pizza', 'Supreme', 'Genoa Salami, Capocollo, Pepperoni, Tomatoes, Asiago Cheese, Garlic'),
    ('prsc_argla', 'The Prosciutto and Arugula Pizza', 'Supreme', 'Prosciutto di San Daniele, Arugula, Mozzarella Cheese'),
    ('sicilian', 'The Sicilian Pizza', 'Supreme', 'Coarse Sicilian Salami, Tomatoes, Green Olives, Luganega Sausage, Onions, Garlic'),
    ('soppressata', 'The Soppressata Pizza', 'Supreme', 'Soppressata Salami, Fontina Cheese, Mozzarella Cheese, Mushrooms, Garlic'),
    ('spicy_ital', 'The Spicy Italian Pizza', 'Supreme', 'Capocollo, Tomatoes, Goat Cheese, Artichokes, Peperoncini verdi, Garlic'),
    ('spinach_supr', 'The Spinach Supreme Pizza', 'Supreme', 'Spinach, Red Onions, Pepperoni, Tomatoes, Artichokes, Kalamata Olives, Garlic, Asiago Cheese'),
    ('five_cheese', 'The Five Cheese Pizza', 'Veggie', 'Mozzarella Cheese, Provolone Cheese, Smoked Gouda Cheese, Romano Cheese, Blue Cheese, Garlic'),
    ('four_cheese', 'The Four Cheese Pizza', 'Veggie', 'Ricotta Cheese, Gorgonzola Piccante Cheese, Mozzarella Cheese, Parmigiano Reggiano Cheese, Garlic'),
    ('green_garden', 'The Green Garden Pizza', 'Veggie', 'Spinach, Mushrooms, Tomatoes, Green Olives, Feta Cheese'),
    ('ital_veggie', 'The Italian Vegetables Pizza', 'Veggie', 'Eggplant, Artichokes, Tomatoes, Zucchini, Red Peppers, Garlic, Pesto Sauce'),
    ('mediterraneo', 'The Mediterranean Pizza', 'Veggie', 'Spinach, Artichokes, Kalamata Olives, Sun-dried Tomatoes, Feta Cheese, Plum Tomatoes, Red Onions'),
    ('mexicana', 'The Mexicana Pizza', 'Veggie', 'Tomatoes, Red Peppers, Jalapeno Peppers, Red Onions, Cilantro, Corn, Chipotle Sauce, Garlic'),
    ('spin_pesto', 'The Spinach Pesto Pizza', 'Veggie', 'Spinach, Artichokes, Tomatoes, Sun-dried Tomatoes, Garlic, Pesto Sauce'),
    ('spinach_fet', 'The Spinach and Feta Pizza', 'Veggie', 'Spinach, Mushrooms, Red Onions, Feta Cheese, Garlic'),
    ('veggie_veg', 'The Vegetables + Vegetables Pizza', 'Veggie', 'Mushrooms, Tomatoes, Red Peppers, Green Peppers, Red Onions, Zucchini, Spinach, Garlic');