import React from "react";
import { Text, Box, Button, Center, View } from "native-base"
import { StyleSheet } from "react-native";
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import SelectView from "./SelectView";
import RewardView from "./RewardView";
import MapView from "./MapView";
import WaitView from "./WaitView";

const Stack = createNativeStackNavigator();

const Main = ({ navigation }) => {
    return (

        <Box style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>



            <Center flex={1} px="3">
                <Button style={styles.roundButton} onPress={() => navigation.navigate('SelectView')}>

                    <Text style={styles.textLabel}>رسكل</Text>



                </Button>

            </Center>
        </Box>


    );
};
const MainView = () => {


    return (

        <Stack.Navigator screenOptions={{
           
                headerTransparent: true,
                headerTitleStyle: {
                  color: "transparent",
                },
                
             
            
        }}>
            <Stack.Screen name="Main" component={Main}  />
            <Stack.Screen name="SelectView" component={SelectView} />
            <Stack.Screen name="RewardView" component={RewardView} />
            <Stack.Screen name="MapView" component={MapView} />
            <Stack.Screen name="WaitView" component={WaitView} />




        </Stack.Navigator>

    )
}
export default MainView;
const styles = StyleSheet.create({
    roundButton: {
        width: 100,
        height: 100,
        justifyContent: 'center',
        alignItems: 'center',
        padding: 10,
        borderRadius: 100,
        //backgroundColor: 'orange',
        color: 'primary'
    },
    textLabel: {
        fontFamily: "ArslanWessam",
        fontSize: 36,
    },
})