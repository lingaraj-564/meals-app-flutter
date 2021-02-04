import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function savefilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, {this.savefilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget _switchListtile({
    String title,
    String subtitle,
    bool currentvalue,
    Function updatevaluefunction,
  }) {
    return SwitchListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        value: currentvalue,
        subtitle: Text(subtitle),
        onChanged: updatevaluefunction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1e88e5),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedfilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.savefilters(selectedfilters);
            },
          ),
        ],
        title: Text('Your Filters'),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Selection',
              style: TextStyle(
                  fontFamily: 'IBMPlexSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _switchListtile(
                  subtitle: 'Only include gluten-free meals',
                  title: 'Gluten-free',
                  currentvalue: _glutenFree,
                  updatevaluefunction: (newvalue) {
                    setState(
                      () {
                        _glutenFree = newvalue;
                      },
                    );
                  },
                ),
                _switchListtile(
                  title: 'Lactose-free',
                  subtitle: 'Only include Lactose-free meals',
                  currentvalue: _lactoseFree,
                  updatevaluefunction: (newValue) {
                    _lactoseFree = newValue;
                  },
                ),
                _switchListtile(
                  title: 'vegetarian',
                  subtitle: 'Only include vegetarian meals',
                  currentvalue: _vegetarian,
                  updatevaluefunction: (newValue) {
                    _vegetarian = newValue;
                  },
                ),
                _switchListtile(
                  title: 'vegan',
                  subtitle: 'Only include vegan meals',
                  currentvalue: _vegan,
                  updatevaluefunction: (newValue) {
                    _vegan = newValue;
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
