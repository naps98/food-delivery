import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_app/screens/auth/blocs/sing_in_bloc/sign_in_bloc.dart';
import 'package:delivery_app/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:delivery_app/screens/home/views/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset('assets/8.png', scale: 35),
            const SizedBox(width: 8),
            const Text(
              'Foodie',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
                /*showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      contentPadding: EdgeInsets.all(0),

                      content: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // color: Colors.red,
                        ),
                        child: Column(
                          children: [
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "Are you sure you want to logout?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Flexible(
                                  child: InkWell(
                                    onTap:(){
                                      Navigator.pop(context);
                                      context.read<SignInBloc>().add(SignOutRequired());
                                    },
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.25),
                                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10)),
                                      ),
                                      child:Text(
                                        "Yes",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Flexible(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.25),
                                        borderRadius: BorderRadius.only(bottomRight:Radius.circular(10)),
                                      ),
                                      child:Text(
                                        "No",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ) ],
                            ),
                          ],
                        ),
                      ),
                    ));*/
              },
              icon: const Icon(CupertinoIcons.arrow_right_to_line)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
          builder: (context, state) {
            if(state is GetPizzaSuccess) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 9 / 16),
                itemCount: state.pizzas.length,
                itemBuilder: (context, int i) {
                  return Material(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => DetailsScreen(
                              state.pizzas[i]
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(state.pizzas[i].picture),
                          SizedBox(width: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: state.pizzas[i].isVeg
                                      ? Colors.green
                                      : Colors.red,
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    child: Text(
                                      state.pizzas[i].isVeg
                                        ? "VEG"
                                        : "NON-VEG",
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    child: Text(
                                      state.pizzas[i].spicy == 1
                                        ? "🌶️ BLAND"
                                        : state.pizzas[i].spicy == 2
                                          ? "🌶️ BALANCE"
                                          : "🌶️ SPICY",
                                      style: TextStyle(
                                        color: state.pizzas[i].spicy == 1
                                        ? Colors.green
                                        : state.pizzas[i].spicy == 2
                                          ? Colors.orange
                                          : Colors.redAccent, 
                                        fontWeight: FontWeight.w800, 
                                        fontSize: 10
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              state.pizzas[i].name,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                               state.pizzas[i].description,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "₹${state.pizzas[i].price - (state.pizzas[i].price * (state.pizzas[i].discount) / 100)}",
                                      style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "₹${state.pizzas[i].price}.00",
                                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500, fontWeight: FontWeight.w700, decoration: TextDecoration.lineThrough),
                                    ),
                                  ],
                                ),
                                IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.add_circled_solid))
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  );
                }
              );
            } else if(state is GetPizzaLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text(
                  "An error has occured..."
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
