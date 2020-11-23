import axios from 'axios';
import { apiGitHub } from '../../constants';
import { SET_EMAIL, SET_PASSWORD, SET_REPOS } from './actionTypes';

export const setEmail = email => ({ type: SET_EMAIL, data: email })
export const setPassword = password => ({ type: SET_PASSWORD, data: password })

export async function getRepos(authStr){ 
    const response = await axios.get(apiGitHub.BASE_URL, {
        headers: { 'Authorization': authStr }
    })

    const repos = await axios.get(response.data.repos_url)
    return {
        type: SET_REPOS, data: repos
    }
}