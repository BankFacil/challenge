import { createStackNavigator } from '@react-navigation/stack'
import React from 'react'
import CommitsScreen from '../screens/CommitsScreen'
import LoginScreen from '../screens/LoginScreen'
import ReposScreen from '../screens/ReposScreen'

const Stack = createStackNavigator()

const RootStack = () => {
    return (
        <Stack.Navigator>
            <Stack.Screen
                name='LoginScreen'
                component={LoginScreen}
                options={{
                    title: 'Login',
                }}
            />
            <Stack.Screen
                name='ReposScreen'
                component={ReposScreen}
                options={{
                    title: 'Repositórios',
                }}
            />
            <Stack.Screen
                name='CommitsScreen'
                component={CommitsScreen}
                options={{
                    title: 'Commits',
                }}
            />
        </Stack.Navigator>
    )
}

export default RootStack
