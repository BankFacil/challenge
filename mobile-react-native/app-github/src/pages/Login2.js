import React, { useState, useEffect } from "react";
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

import { Buffer } from "buffer";

import api from "../services/api";

import logo from "../assets/logo.png";

export default function Login2({ navigation }) {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  async function handleNextSubmit() {
    const fields = new Buffer(username + ":" + password);
    const encoded = fields.toString("base64");

    try {
      await api.get("/user", {
        headers: {
          Authorization: "Basic " + encoded,
        },
      });
      navigation.navigate("Repositories");
    } catch (err) {
      Alert.alert("Invalid password");
    }
  }

  useEffect(() => {
    AsyncStorage.getItem("username").then((value) => {
      setUsername(value);
    });
  }, []);

  async function handleBackSubmit() {
    navigation.navigate("Login1");
  }

  return (
    <KeyboardAvoidingView style={styles.container}>
      <Image source={logo} style={styles.image} />
      <Text style={styles.username}>{username}</Text>
      <View>
        <TextInput
          style={styles.input}
          placeholder="Password"
          placeholderTextColor="#999"
          secureTextEntry={true}
          autoCorrect={false}
          value={password}
          onChangeText={(text) => setPassword(text)}
        />
      </View>
      <TouchableOpacity onPress={handleNextSubmit} style={styles.nextButton}>
        <Text style={styles.textbutton}>Login</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={handleBackSubmit} style={styles.backButton}>
        <Text style={styles.textbutton}>Back</Text>
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
  username: {
    marginTop: 30,
    fontSize: 18,
  },
  input: {
    textAlign: "center",
    borderWidth: 1,
    borderColor: "#DDD",
    width: 250,
    paddingVertical: 5,
    fontSize: 16,
    color: "#000",
    marginTop: 50,
    borderRadius: 2,
  },
  nextButton: {
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
  backButton: {
    paddingHorizontal: 20,
    paddingVertical: 5,
    backgroundColor: "#fff",
    justifyContent: "center",
    alignItems: "center",
    marginTop: 30,
    borderRadius: 3,
    borderColor: "#999",
    borderWidth: 2,
  },
  textbutton: {
    fontSize: 15,
    color: "#999",
  },
});
