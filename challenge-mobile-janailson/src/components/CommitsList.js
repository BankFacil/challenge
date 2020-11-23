import React from 'react'
import { View, Text, Image, StyleSheet } from 'react-native'

const CommitsList = ({ avatar, message, dateCommit }) => {

    const date = String(dateCommit).split('T')[0].toString()

    return (
        <View style={styles.container}>
            <Image style={styles.image} source={{ uri: avatar }} />
            <View style={{ flexDirection: 'column', flexWrap: 'wrap' }}>
                <Text>Mensagem: {message}</Text>
                <Text>Data do commit: {date}</Text>
            </View>
        </View>
    )
}

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        backgroundColor: '#fff',
        padding: 15,
        marginTop: 15,
        alignItems: 'center',
        width: '100%',
    },
    image: {
        height: 60,
        width: 60,
        borderRadius: 50,
        marginRight: 15
    }
})

export default CommitsList
