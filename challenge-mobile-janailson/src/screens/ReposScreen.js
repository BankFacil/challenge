import React from 'react'
import { Image, StyleSheet, View } from 'react-native'
import Input from '../components/Input'
import RepoList from '../components/RepoList'
import { useSelector } from 'react-redux'

const ReposScreen = (props) => {
    const repos = useSelector(state => state.repos.repos)
    
    return (

        <View style={styles.container }>
            <View style={styles.header}>
                <View style={styles.image}>
                    <Image source={require('../assets/GitHub-Mark-64px.png')} />
                    <Image source={require('../assets/GitHub_Logo.png')} style={{ width: '50%', height: '70%' }} />
                </View>
                <View style={styles.input}>
                    <Input icon={'magnify'} placeholder="Repository Search" />
                </View>
            </View>
            <View style={styles.list}>
                <RepoList list={repos} navigation={props.navigation} />
            </View>
        </View>
    )
}

const styles = StyleSheet.create({
    container:{
        flex: 1, 
        padding: 20
    },
    header:{
        alignItems: 'center'
    },
    image:{
        flexDirection: 'row', 
        justifyContent: 'center', 
        alignItems: 'center' 
    },
    input:{
        marginTop: 20, 
        width: '100%'
    },
    list:{
        marginTop: 20, 
        width: '100%'
    }
})

export default ReposScreen
