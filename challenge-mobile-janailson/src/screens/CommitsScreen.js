import useAxios from 'axios-hooks'
import React, { useState, useEffect } from 'react'
import { Image, StyleSheet, Text, View, FlatList, ActivityIndicator } from 'react-native'
import { apiGitHub } from '../constants'
import CommitsList from '../components/CommitsList'

const CommitsScreen = ({ route }) => {

  const [commitUrl, setCommitUrl] = useState('')
  const [repoName, setRepoName] = useState('')
 
  useEffect(() => {
    setCommitUrl(String(route.params.url).replace('{/sha}', ''))
    setRepoName(String(route.params.name))
  }, [])

  const [{ data, loading, error }] = useAxios(commitUrl)

  if (loading) return (<View style={styles.loading}>
    <ActivityIndicator size='large' />
  </View>)
  if (error) return (<View style={styles.loading}><Text>Error!</Text></View>)

  return (
    <View style={styles.container}>
      <View style={{ alignItems: 'center' }}>
        <View style={styles.images}>
          <Image source={require('../assets/GitHub-Mark-64px.png')} />
          <Image source={require('../assets/GitHub_Logo.png')} style={{ width: '50%', height: '70%' }} />
        </View>
      </View>
      <View style={styles.repository}>
        <Text>{repoName}</Text>
      </View>
      <View style={styles.list}>
        <FlatList
          contentContainerStyle={{ alignSelf: 'stretch' }}
          data={data}
          renderItem={({ item }) =>  <CommitsList 
                                          message={item.commit.message} 
                                          avatar={!!item.committer ? item.committer.avatar_url : apiGitHub.NO_AVATAR_IMAGE.toString()} 
                                          dateCommit={item.commit.committer.date}
                                      />}
          keyExtractor={item => `${item.sha}`}
          showsVerticalScrollIndicator={false}
        />
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20
  },
  images: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center'
  },
  input: {
    marginTop: 20,
    width: '100%'
  },
  list: {
    marginTop: 20,
    width: '100%',
    height: '80%'
  },
  loading: {
    flex: 1, 
    justifyContent: 'center', 
    alignItems: 'center'
  },
  repository: {
    backgroundColor: '#fff', 
    justifyContent: 'center', 
    alignItems: 'center', 
    padding: 15, 
    marginTop: 15
  }
})

export default CommitsScreen
