import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer( // 抽屉菜单
          backgroundColor: Colors.white, // 设置背景色为白色
          child: ListView( // 列表视图
            padding: EdgeInsets.zero, // 内边距为零
            children: <Widget>[ // 子元素列表
              UserAccountsDrawerHeader(
            accountName:
                const Text('dunk', style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: const Text('dunkstarinmymind@gmmtv.net'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM07EUABsOMvrtVkKF8dtVhBX2sLjrCnDq6A&usqp=CAU'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: const NetworkImage(
                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmY7QLWlLKWHgdGyOL0iFo9hkqQj8nRxo7jA&usqp=CAU'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.yellow[400]!.withOpacity(0.6), BlendMode.hardLight),
              ),
            ),
          ),
               ListTile( // 列表项
                title: const Text('Message',textAlign: TextAlign.right,), // 标题
                trailing: const Icon(Icons.message,color: Colors.black12, size: 22.0,), // 尾部图标
                onTap: () => Navigator.pop(context),
                //是Flutter中用来导航的方法，Navigator可以将路由压入路由栈（push），也可以从路由栈中弹出（pop）路由。
              ),
               ListTile( // 列表项
                title: const Text('Favorite',textAlign: TextAlign.right,), // 标题
                trailing: const Icon(Icons.favorite,color: Colors.black12, size: 22.0,), // 尾部图标
                onTap: () => Navigator.pop(context),
              ),
               ListTile( // 列表项
                title: const Text('Settings',textAlign: TextAlign.right,), // 标题
                trailing: const Icon(Icons.settings,color: Colors.black12, size: 22.0,), // 尾部图标
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
  }
}