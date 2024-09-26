import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}

class Recipe {
  final String title;
  final String description;
  final String imageUrl;

  Recipe({required this.title, required this.description, required this.imageUrl});
}

// Sample data
final List<Recipe> recipes = [
  Recipe(
    title: 'Pasta',
    description: '''Ingredients for making pasta:
- Pasta (any type: spaghetti, penne, etc.)
- Water (for boiling)
- Salt
- Olive oil (optional)
- Pasta sauce (tomato, Alfredo, pesto, etc.)
- Cheese (optional)
- Vegetables or meat (optional for adding into sauce)

Process:
1. Boil Water: Bring a large pot of water to a boil, then add a pinch of salt.
2. Cook Pasta: Add the pasta to the boiling water and cook according to the package instructions (usually 8-12 minutes).
3. Drain: Once the pasta is cooked, drain it in a colander. Optionally, toss with a little olive oil to prevent sticking.
4. Prepare Sauce: While the pasta cooks, heat your choice of sauce in a pan. Add any vegetables, meat, or spices you like.
5. Mix Pasta & Sauce: Once both are ready, mix the drained pasta with the sauce in the pan. Cook for 1-2 minutes to combine flavors.
6. Serve: Top with cheese or herbs, if desired, and serve hot.''',
    imageUrl: 'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ),
  Recipe(
    title: 'Jian Bing',
    description: '''Ingredients for making Jian Bing (Chinese Crêpes): 
- 2 tablespoons millet flour
- 2 tablespoons soy milk
- ½ teaspoon vegetable oil
- 1 teaspoon water, if needed
- 1 tablespoon Chinese black bean sauce
- 1 teaspoon water
- ½ teaspoon Asian chile pepper sauce, or to taste
- cooking spray
- 1 large egg, beaten
- ½ green onion, sliced
- 1 tablespoon torn fresh cilantro leaves
- 2 whole crackers

Process:
1. Whisk millet flour, soy milk, and vegetable oil together in a bowl to make a batter with the consistency of heavy cream. Add a teaspoon of water to thin the batter, if necessary.
2. Mash black bean sauce in a small bowl with 1 teaspoon water to make it easy to spread. Mix hot chili sauce with 1 teaspoon of water in a separate small bowl. Set both sauces aside.
3. Spray a large skillet generously with cooking spray, and heat over medium-low heat. Pour batter into the skillet, and spread evenly to make a thin crêpe; cook until firm, about 1 to 2 minutes. Pour egg evenly over crêpe; cook an additional 1 to 2 minutes, until egg is set. Sprinkle crêpe with green onion slices and cilantro leaves, pressing them firmly into cooked egg.
4. Flip crêpe and spread with bean sauce and chili sauce. Place crackers in the center of crêpe, leaving about 1/4 inch of space between the two crackers. Flip top third of crêpe down over crackers; flip the bottom third up, and then fold the crêpe in half so the crackers are stacked on top of each other in a tidy package. Serve hot.
''',
    imageUrl: 'https://www.communekitchen.com/uploads/1/1/9/9/119995411/jian-bing.jpg',
  ),
  Recipe(
    title: 'Kheer',
    description: '''Ingredients for Kheer:
- Rice: 1/4 cup (preferably basmati or any long-grain rice)
- Milk: 4 cups (full-fat milk for creaminess)
- Sugar: 1/2 cup (adjust to taste)
- Cardamom: 2-3 pods (crushed)
- Saffron: A few strands (optional, for color and flavor)
- Nuts: 2-3 tablespoons (cashews, almonds, or pistachios, chopped)
- Raisins: 2 tablespoons (optional)

Process:
1. Rinse the Rice: Wash the rice thoroughly and soak it in water for about 30 minutes. Drain the water afterward.
2. Boil Milk: In a heavy-bottomed pan, bring the milk to a boil. Stir occasionally to prevent it from burning.
3. Add Rice: Once the milk boils, add the soaked and drained rice. Lower the heat and cook, stirring occasionally.
4. Cook Until Thick: Let it simmer for about 30-40 minutes until the rice is cooked and the mixture thickens. If using saffron, soak it in a tablespoon of warm milk and add it during this step.
5. Add Sugar and Flavorings: Stir in the sugar, crushed cardamom, and any nuts or raisins. Cook for an additional 5-10 minutes.
6. Serve: Once the kheer reaches the desired consistency, remove it from heat. You can serve it warm or chilled.''',
    imageUrl: 'https://mytastycurry.com/wp-content/uploads/2021/09/quinoa-kheer.jpg',
  ),
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> _favoriteStatus = List.filled(recipes.length, false);

  List<Recipe> get _favoriteRecipes {
    return recipes.where((recipe) => _favoriteStatus[recipes.indexOf(recipe)]).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delicious Recipes'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/favorites',
                arguments: _favoriteRecipes,
              );
            },
          ),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Recipes Menu',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.7),
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoritesNamesScreen(favoriteRecipes: _favoriteRecipes),
                      ),
                    );
                  },
                  child: Text(
                    'View Favorite Recipe Names',
                    style: TextStyle(color: Colors.white), // Change text color here
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, // Button background color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.blue.shade100,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(recipes[index].imageUrl),
                            ),
                            title: Text(
                              recipes[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 22,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                _favoriteStatus[index] ? Icons.favorite : Icons.favorite_border,
                                color: _favoriteStatus[index] ? Colors.red : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  _favoriteStatus[index] = !_favoriteStatus[index];
                                });
                              },
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/details',
                                arguments: recipes[index],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(recipe.imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.7),
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    recipe.description,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Recipe> favoriteRecipes = ModalRoute.of(context)!.settings.arguments as List<Recipe>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes'),
        backgroundColor: Colors.deepPurple,
      ),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text('No favorite recipes yet!', style: TextStyle(fontSize: 20)))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.blue.shade100,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(favoriteRecipes[index].imageUrl),
                    ),
                    title: Text(
                      favoriteRecipes[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontSize: 22,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: favoriteRecipes[index],
                      );
                    },
                  ),
                );
              },
          ),
    );
  }
}

class FavoritesNamesScreen extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  FavoritesNamesScreen({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipe Names'),
        backgroundColor: Colors.deepPurple,
      ),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text('No favorite recipes yet!', style: TextStyle(fontSize: 20)))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    favoriteRecipes[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.deepPurple,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: favoriteRecipes[index],
                    );
                  },
                );
              },
            ),
    );
  }
}
