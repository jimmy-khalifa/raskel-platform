import React from "react";
import { Text, View, Button } from "native-base"
import { StyleSheet } from "react-native";


const OperationsView = () => {

    return (
        <View style={styles.container}>
            <Text>Profile Screen</Text>
            <Button
                onPress={() => alert('Button Clicked!')}
            >
                Press here
            </Button>
        </View>
    )
}
export default OperationsView;
const styles = StyleSheet.create({
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center'
    },
});