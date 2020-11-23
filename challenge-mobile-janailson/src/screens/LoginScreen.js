import React, { useState, useEffect } from 'react'
import { Image, StyleSheet, View, Text, Alert } from 'react-native'
import base64 from 'react-native-base64'
import { useSelector, useDispatch } from 'react-redux'
import { setEmail, setPassword, getRepos } from '../store/actions'
import Button from '../components/Button'
import Input from '../components/Input'
import { validEmail } from '../utils/EmailValidation'

const LoginScreen = (props) => {

    const [ userEmail, setUserEmail ] = useState('')
    const [ userPassword, setUserPassword ] = useState('')
    const [ authStr, setAuthStr] = useState('')
    const email = useSelector(state => state.login.email)
    const dispatch = useDispatch()

    useEffect(() => {
        setAuthStr('Basic '.concat(base64.encode(email +':'+ userPassword)))
    }, [userPassword])

    handlerSendEmail = () => {
        if(!validEmail(userEmail)){
            return Alert.alert('Email inválido', 'Digite um email válido')
        }
        return dispatch(setEmail(userEmail))
    }

    handlerCleanEmail = () => {
        dispatch(setEmail(''))
    }

    handlerSendPassword = () => {
        dispatch(setPassword(userPassword))
        dispatch(getRepos(authStr))
        props.navigation.navigate('ReposScreen')
    }

    function renderStepOne() {
        return (
            <View style={styles.container}>
                <View>
                    <Image source={require('../assets/GitHub-Mark-120px-plus.png')} />
                </View>
                <View style={styles.input} >
                    <Input placeholder='Your Github email address' autoCapitalize='none' onChangeText={(text) => setUserEmail(text)} />
                </View>
                <View style={styles.button}>
                    <Button text="Next" color="#93e500" onPress={() => handlerSendEmail()} />
                </View>
            </View>
        )
    }

    function renderStepTwo() {
        return (
            <View style={styles.container}>
                <View>
                    <Image source={require('../assets/GitHub-Mark-120px-plus.png')} />
                </View>
                <View style={styles.email}>
                    <Text>{email}</Text>
                </View>
                <View style={styles.inputPass} >
                    <Input placeholder='Password' secureTextEntry autoCapitalize='none' onChangeText={(text) => setUserPassword(text)} />
                </View>
                <View style={styles.button}>
                    <Button text="Login" color="#93e500" onPress={() => handlerSendPassword() } />
                </View>
                <View style={styles.button}>
                    <Button text="Back" color="#93e500" onPress={() => handlerCleanEmail() } />
                </View>
            </View>
        )
    }

    return (
        !!email ? renderStepTwo() : renderStepOne()
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        padding: 20
    },
    input: {
        width: '100%',
        marginTop: 150
    },
    inputPass: {
        width: '100%',
        marginTop: 50
    },
    button: {
        marginTop: 30,
        width: '100%'
    },
    email: {
        width: '100%',
        marginTop: 50,
        alignItems: 'center'
    },
})

export default LoginScreen;
