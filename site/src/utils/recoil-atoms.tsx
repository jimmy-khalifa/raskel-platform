import { atom } from 'recoil'

export const collapsedState = atom({
    key: 'collapsedState',
    default: true,
})

export const langState = atom({
    key: 'langState',
    default: 'ar'
})