import React, { useState } from "react";

import {
  View,
  Text,
  Image,
  StyleSheet,
  KeyboardAvoidingView,
  TextInput,
  TouchableOpacity,
  AsyncStorage,
  Alert,
} from "react-native";

import api from "../services/api";

import logo from "../assets/logo.png";

export default function Login1({ navigation }) {
  const [username, setUsername] = useState("");

  async function handleSubmit() {
    try {
      const reponse = await api.get(`/users/${username}`);
      await AsyncStorage.setItem("username", reponse.data.login);
      navigation.navigate("Login2");
    } catch (err) {
      Alert.alert("User not exists");
    }
  }

  return (
    <KeyboardAvoidingView style={styles.container}>
      <Image source={logo} style={styles.image} />
      <View>
        <TextInput
          style={styles.input}
          placeholder="Your Github username"
          placeholderTextColor="#999"
          autoCorrect={false}
          value={username}
          onChangeText={(text) => setUsername(text)}
        />
      </View>
      <TouchableOpacity onPress={handleSubmit} style={styles.button}>
        <Text style={styles.textbutton}>Next</Text>
      </TouchableOpacity>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  image: {
    width: 250,
    height: 250,
  },
  input: {
    textAlign: "center",
    width: 250,
    borderWidth: 1,
    borderColor: "#DDD",
    paddingVertical: 5,
    fontSize: 16,
    color: "#000",
    marginTop: 80,
    borderRadius: 2,
  },
  button: {
    paddingHorizontal: 20,
    paddingVertical: 5,
    backgroundColor: "#fff",
    justifyContent: "center",
    alignItems: "center",
    marginTop: 50,
    borderRadius: 3,
    borderColor: "#999",
    borderWidth: 2,
  },
  textbutton: {
    fontSize: 15,
    color: "#999",
  },
});
