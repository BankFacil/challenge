import React from 'react'
import { View, Text, TouchableNativeFeedback, StyleSheet } from 'react-native'

const Button = (props) => {
    return (
        <View style={style.container}>
            <TouchableNativeFeedback
                onPress={props.onPress}
                background={TouchableNativeFeedback.SelectableBackground()}>
                <View style={ [style.title, { backgroundColor: props.color }] }>
                    <Text style={ style.text }>{props.text}</Text>
                </View>
            </TouchableNativeFeedback>
        </View>
    )
}

const style = StyleSheet.create({
    container: {
        marginTop: 10, 
        width: "100%" 
    },
    title: {
        width: "100%", 
        height: 50,
        borderRadius: 25, 
        alignItems: "center", 
        justifyContent: "center"
    },
    text: {
        color: "#000"
    }
})

export default Button;