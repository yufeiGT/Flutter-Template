import 'package:flutter/material.dart';

// plugins
import './plugins/adapt.dart';

void main() =>
	runApp(new MaterialApp(
		title: 'Flutter Template',
		theme: new ThemeData(
//		primaryColor: Colors.white,
			primarySwatch: Colors.blue,
		),
		home: new AppMain(),
	));

// 主体
class AppMain extends StatefulWidget {
	@override
	AppMainState createState() => new AppMainState();
}

class AppMainState extends State<AppMain> {
	
	int _selectedItem = 0;
	final PageController _pageController = new PageController(
		initialPage: 0,
	);
	
	_onPageChanged(index) {
		setState(() {
			_selectedItem = index;
		});
	}
	
	double _size = Adapt.px(60);
	_getNavigationItem(String icon, String activeIcon, String title) {
		return new BottomNavigationBarItem(
			icon: new Image.asset(
				icon,
				width: _size,
				height: _size,
				fit: BoxFit.cover,
			),
			activeIcon: new Image.asset(
				activeIcon,
				width: _size,
				height: _size,
				fit: BoxFit.cover,
			),
			title: new Text(
				title,
				style: new TextStyle(
					fontSize: Adapt.px(24),
				),
			),
		);
	}
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			body: new PageView(
				controller: _pageController,
				onPageChanged: _onPageChanged,
				children: <Widget>[
					new Scaffold(
						appBar: new AppBar(
							title: new Center(
								child: new Text('首页'),
							),
						),
					),
					new Scaffold(
						appBar: new AppBar(
							title: new Center(
								child: new Text('我的'),
							),
						),
					),
				],
			),
			bottomNavigationBar: new BottomNavigationBar(
				type: BottomNavigationBarType.fixed,
				items: [
					_getNavigationItem('images/home.png', 'images/home_active.png', '首页'),
					_getNavigationItem('images/user.png', 'images/user_active.png', '我的'),
				],
				currentIndex: _selectedItem,
				onTap: (index) {
					_pageController.jumpToPage(index);
					_onPageChanged(index);
				},
			),);
	}
}