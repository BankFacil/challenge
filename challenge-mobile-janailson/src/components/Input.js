import React from 'react'
import { View, TextInput, StyleSheet } from 'react-native'
import Icon from 'react-native-vector-icons/MaterialCommunityIcons'

const Input = (props) => {
    return (
        <View style={style.container}>
            <Icon name={ props.icon } size={20} color="#A9A9A9" style={ style.icon } />
            <TextInput
                onChangeText={props.onChangeText}
                style={ style.input}
                placeholder={props.placeholder}
                underlineColorAndroid="transparent"
                secureTextEntry={props.secureTextEntry}
                autoCapitalize={props.autoCapitalize}
            />
        </View>
    )
}

const style = StyleSheet.create({
    container: {
        flexDirection: "row", 
        justifyContent: "center", 
        alignItems: "center", 
        borderColor: '#A9A9A9', 
        borderWidth: 0.5, 
        borderRadius: 25
    },
    icon: {
        padding: 10
    },
    input: {
        flex: 1
    }
})

export default Input