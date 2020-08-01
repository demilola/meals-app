import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key key, this.meal}) : super(key: key);
  final Meal meal;

//Getters are implemented here so as to convert the enums into Strings
  String get _complexityText {
    switch (meal.complexity) {
      case Complexity.easy:
        return 'Easy';
        break;
      case Complexity.challenging:
        return 'Challenging';
        break;
      case Complexity.hard:
        return 'Hard';
        break;
      default:
        return 'Unknown Error';
    }
  }

  String get _affordabilityText {
    switch (meal.affordability) {
      case Affordability.inexpensive:
        return 'Inexpensive';
        break;
      case Affordability.pricey:
        return 'Pricey';
        break;
      case Affordability.luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown Error';
    }
  }

  void _selectMeal(context) {
    Navigator.pushNamed(
      context,
      MealDetailsScreen.id,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //Used inkwell because of the ripple effct
      onTap: () => _selectMeal(context),
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5.0,
        margin: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Stack(
              //To get ultraspecicic about alignment, use lerp or doubles as shown below. You can also use positioned widget or Align widget on the item you are targetting
              alignment: Alignment(1.0, 0.75),
              // Alignment.lerp(
              //   Alignment.bottomRight,
              //   Alignment.centerRight,
              //   0.25,),
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                    // child: Hero(
                    //     tag: 'mealImage',
                    child: Image.network(
                      meal.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 200.0,
                    )),
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 220.0,
                  color: Colors.black54,
                  child: Text(
                    meal.title,
                    style: Theme.of(context).textTheme.headline5.apply(
                          color: Colors.white,
                        ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 4.0),
                    Text('${meal.duration} min')
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(width: 4.0),
                    Text(_complexityText)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    // SizedBox(width: 4.0),
                    Text(_affordabilityText)
                  ],
                )
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
