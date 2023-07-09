import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.amber.shade900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.withOpacity(0),
        leading: const Icon(IconlyLight.category),
        title: const Text(appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.notification),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.setting),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueGrey,
                  ),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(IconlyLight.filter)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.blueGrey.shade500,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      prefixIcon: const Icon(
                        IconlyLight.search,
                        size: 20,
                      ),
                    ),
                    style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: 12,
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.43,
                    margin: const EdgeInsets.only(right: 15),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.YTvPkPqknzMBQmTiojSr_gHaFB?pid=ImgDet&rs=1'),
                          fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Text(
                                'Move name',
                                style: theme.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w800,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  IconlyLight.star,
                                  size: 18,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '****',
                                  style: theme.textTheme.titleSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
