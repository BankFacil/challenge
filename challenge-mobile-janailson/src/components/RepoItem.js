import React from 'react'
import { StyleSheet, Text, View, TouchableNativeFeedback } from 'react-native'
import Icon from 'react-native-vector-icons/FontAwesome'

const RepoItem = (props) => {

    return (
        <TouchableNativeFeedback onPress={props.onPress}>
            <View style={styles.container}>
                <View>
                    <Text>{props.title}</Text>
                    <Text>{props.description}</Text>
                </View>
                <Icon name={'angle-right'} color={'#D3D3D3'} size={30} />
            </View>
        </TouchableNativeFeedback>
    )
}

export default RepoItem

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        width: '100%',
        backgroundColor: '#fff',
        marginTop: 15,
        padding: 15
    }

})
