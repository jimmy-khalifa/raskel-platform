import React from "react";
import 'react-native-gesture-handler';
import { Button, NativeBaseProvider, Text, View, } from "native-base";
import { NavigationContainer } from '@react-navigation/native';
import { createDrawerNavigator } from '@react-navigation/drawer';
import theme from "./src/theme";
import DrawerContent from './src/layouts/DrawerContent' ;
import MainView from "./src/views/MainView";
const Drawer = createDrawerNavigator();



const App = () => {
  return (
    <NativeBaseProvider theme={theme}>

      <NavigationContainer>
       

        <Drawer.Navigator drawerContent={props => <DrawerContent{...props}/>} initialRouteName="Home" screenOptions={{
          headerTransparent: true,
          drawerPosition: "right",
          headerTitleStyle: {
            color: 'transparent'
          },



        }}>
          <Drawer.Screen options={{
            title: 'Awesome app',
          }} name="Home" component={MainView} />
         
        </Drawer.Navigator>
      </NavigationContainer>

    </NativeBaseProvider>
  );
}
export default App;
