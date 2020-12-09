import React, { useState, useEffect } from "react";
import {
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  Image,
  FlatList,
  AsyncStorage,
  Alert,
} from "react-native";
import Constants from "expo-constants";

import api from "../services/api";

import banner from "../assets/banner.png";

export default function Commits({ navigation }) {
  const [commits, setCommits] = useState([]);
  const [repo, setRepo] = useState("");

  async function loadCommits() {
    try {
      const username = await AsyncStorage.getItem("username");
      const repo = await AsyncStorage.getItem("repo");
      const commits = await api.get(`/repos/${username}/${repo}/commits`);
      setRepo(repo);
      setCommits(commits.data);
    } catch (err) {
      Alert.alert("This repository has no commits");
    }
  }

  useEffect(() => {
    loadCommits();
  }, []);

  function backRepositories() {
    navigation.navigate("Repositories");
  }

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.repository} onPress={backRepositories}>
        <Image source={banner} style={styles.banner} />
      </TouchableOpacity>

      <Text style={styles.repositoryText}>{repo}</Text>

      <FlatList
        style={styles.commitList}
        data={commits}
        keyExtractor={(commit) => String(commit.sha)}
        showsVerticalScrollIndicator={false}
        onEndReached={loadCommits}
        onEndReachedThreshold={0.2}
        renderItem={({ item: commit }) => (
          <View style={styles.commit}>
            <Image
              style={styles.avatar}
              source={{ uri: commit.author.avatar_url }}
            />
            <View style={styles.message}>
              <Text style={styles.textMessage}>{commit.commit.message}</Text>
            </View>
          </View>
        )}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 10,
    paddingTop: Constants.statusBarHeight,
    alignItems: "center",
  },
  banner: {
    width: 170,
    height: 70,
  },
  repository: {
    marginTop: 10,
  },
  repositoryText: {
    fontSize: 20,
    marginTop: 10,
  },
  commit: {
    flexDirection: "row",
    justifyContent: "space-between",
    paddingTop: 15,
    paddingHorizontal: 10,
    borderRadius: 4,
    marginBottom: 30,
  },
  commitList: {
    marginTop: 32,
  },
  avatar: {
    width: 70,
    height: 70,
    borderRadius: 4,
  },
  message: {
    justifyContent: "center",
    alignItems: "center",
    width: 250,
    paddingHorizontal: 20,
    borderWidth: 1,
    borderColor: "#999",
    borderRadius: 3,
  },
  textMessage: {},
});
