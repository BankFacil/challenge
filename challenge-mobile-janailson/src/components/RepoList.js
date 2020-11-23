import React from 'react'
import { FlatList, Text, View, ActivityIndicator } from 'react-native'
import RepoItem from '../components/RepoItem'

const RepoList = ({ list, navigation }) => {

    const handlerCommits = (url, name) => {
        navigation.navigate('CommitsScreen', { url: url, name: name })
    }

    return (
        !!list ? (
            <View>
                <Text>Repositórios</Text>
                <FlatList
                    data={list.data}
                    renderItem={({ item }) => <RepoItem
                        onPress={() => handlerCommits(item.commits_url, item.name)}
                        title={item.name}
                        description={item.description}
                    />}
                    keyExtractor={item => `${item.id}`}
                />
            </View>
        ) :
            (
                <View style={{ justifyContent: 'center', alignItems: 'center' }}>
                    <ActivityIndicator size='large' />
                </View>
            )
    )
}

export default RepoList

