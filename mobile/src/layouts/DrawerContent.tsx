import React from "react";
import { StyleSheet } from "react-native";
import { Box, Text, View, Avatar, Stack } from "native-base";
import { createDrawerNavigator } from "@react-navigation/drawer";

import Icon from "react-native-vector-icons/MaterialCommunityIcons";
import { DrawerContentScrollView, DrawerItem } from "@react-navigation/drawer";
import { Drawer } from "react-native-paper";
import OperationsView from "../views/OperationsView";

const MyDrawer = createDrawerNavigator();
const DrawerContent = ({ ...props }) => {
  return (
    <Stack height="100%">
      <Drawer.Section style={styles.profileSection} {...props}>
        <Box>
          <Box style={styles.userInfo}>
            <Avatar
              bg="cyan.500"
              source={{
                uri: require("../../assets/user_profile.png"),
              }}
            ></Avatar>
          </Box>
          <Box style={{ flexDirection: "column" }}>
            <Text style={styles.title}>فلان الفلاني</Text>
          </Box>
        </Box>
      </Drawer.Section>

      <Drawer.Section style={styles.menuSection}>
        <DrawerItem
          label="العمليات"
          labelStyle={styles.itemLabel}
          onPress={() => {
            props.navigation.navigate("OperationsView");
          }}
        />
        <DrawerItem
          label="البيانات"
          labelStyle={styles.itemLabel}
          onPress={() => {
            props.navigation.navigate("DataView");
          }}
        />
        <DrawerItem
          label="الصيانة"
          labelStyle={styles.itemLabel}
          onPress={() => {
            props.navigation.navigate("MaintenanceView");
          }}
        />
        <DrawerItem
          label="الإعدادات"
          labelStyle={styles.itemLabel}
          onPress={() => {
            props.navigation.navigate("SettingsView");
          }}
        />
      </Drawer.Section>

      <Drawer.Section style={styles.exitSection}>
        <DrawerItem
          icon={({ color, size }) => (
            <Icon name="exit-to-app" color={color} size={size} />
          )}
          label="خروج"
          labelStyle={styles.itemLabel}
        />
      </Drawer.Section>
    </Stack>
  );
};
export default DrawerContent;

const styles = StyleSheet.create({
  profileSection: {
    height: "25%",
    borderWidth: 0
  },
  menuSection: {
    height: "60%",
  },
  exitSection: {
    height: "15%",
  },
  itemLabel: {
    fontFamily: "ArslanWessam",
    fontSize: 36,
  },
  userInfo: {
    margin: "auto",
  },
  title: {
    fontFamily: "ArslanWessam",
    fontSize: 36,
    color: "#ffffff",
    textAlign: "center",
  },
});
