import React from "react";
import { Text, Box, View, Button } from "native-base"

import { StyleSheet } from "react-native";


const SelectView = ({ navigation }) => {

    return (
        <View flex={1} style={{marginTop:'15%'}}>

            <Box>
            <Button style={styles.organicButton}  onPress={() => console.log('عضوي')}>
                <Text style={styles.textLabel}>عضوي</Text>

            </Button>
            </Box>
            <Box >
            <Button  style={styles.plasticButton} onPress={() => console.log('بلاستيكي')}>
                <Text style={styles.textLabel}>بلاستيكي</Text>

            </Button>
            </Box>
            <Box>
            <Button  style={styles.paperButton} onPress={() => console.log('ورقي')}>
                <Text style={styles.textLabel}>ورقي</Text>

            </Button>
            </Box>
            <Button style={styles.roundButton} onPress={() => navigation.navigate('Main')}>
                <Text style={styles.textLabel}>إلغاء</Text>

            </Button>

        </View>
    )
}
export default SelectView;
const styles = StyleSheet.create({
    roundButton: {
        width: 100,
        height: 100,
        justifyContent: 'center',
        alignItems: 'center',
        padding: 10,
        borderRadius: 100,
        marginTop: '10%',
        color: 'primary',
        margin:'auto'
    },
    textLabel: {
        fontFamily: "ArslanWessam",
        fontSize: 50,
    },
    organicButton:{
        width: 480,
        height: 150,
        backgroundColor: 'rgb(39, 142, 65)'

    },
    plasticButton:{
        width: 480,
        height: 150,
        backgroundColor: 'rgb(107, 150, 253)'

    },
    paperButton:{
        width: 480,
        height: 150,
        backgroundColor: 'white'

    }
})