import React from "react";
import { StyleSheet } from "react-native";
import {
    Text,
    View,
    Avatar, HStack, Center



} from 'native-base';
import { createDrawerNavigator } from '@react-navigation/drawer';

import Icon from 'react-native-vector-icons/MaterialCommunityIcons';
import { DrawerContentScrollView, DrawerItem } from "@react-navigation/drawer";
import { Drawer } from 'react-native-paper';
import OperationsView  from "../views/OperationsView";


const MyDrawer = createDrawerNavigator();
const DrawerContent = (props) => {

    return (

        <View style={{ flex: 1 }}>
            <DrawerContentScrollView {...props}>
                <View>

                    <View style={styles.userInfo}>
                        <Avatar
                            bg="cyan.500"
                            source={{
                                uri: require('../../assets/user_profile.png'),
                            }}>
                           
                        </Avatar>
                        </View>
                        <View style={{flexDirection:'column'}} >
                            <Text style={styles.title}>فلان الفلاني</Text>
                        </View>
                    
                </View>

            </DrawerContentScrollView>

            <Drawer.Section style={styles.items}>
                
                <DrawerItem label="العمليات" onPress={() => {props.navigation.navigate('OperationsView')}}/>
                <DrawerItem label="البيانات" onPress={() => {props.navigation.navigate('DataView')}}/>
                <DrawerItem label="الصيانة" onPress={() => {props.navigation.navigate('MaintenanceView')}}/>
                <DrawerItem label="الإعدادات" onPress={() => {props.navigation.navigate('SettingsView')}}/>

            </Drawer.Section>

            <Drawer.Section style={styles.items}>
                <DrawerItem
                    icon={({ color, size }) => (
                        <Icon
                            name="exit-to-app"
                            color={color}
                            size={size}
                        />
                    )}
                    label="خروج"

                />
            </Drawer.Section>

        </View>
    )
}
export default DrawerContent;

const styles = StyleSheet.create({
   items: {
        marginBottom: 15,
        borderTopColor: '#f4f4f4',
        borderTopWidth: 1
    },
    userInfo: {
        margin:'auto',
        marginTop: "20%"
        
    },
    title: {
        fontSize: 16,
        marginTop: 3,
        fontWeight: 'bold',
        textAlign:'center'
        
},


})