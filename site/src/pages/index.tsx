import React, { useState } from "react"
import Navbar from "../components/App/Navbar"
import Footer from "../components/App/Footer"
import Layout from "../components/App/Layout"
import Banner from "../components/Index/Banner"
import OurSolutions from "../components/Index/OurSolutions"
import OurServices from "../components/Index/OurServices"
import TeamMembers from "../components/DigitalMarketingAgency/TeamMembers"
import ContactForm from "../components/Contact/ContactForm"

const Home = () => {

  return (
      <Layout>
        <Navbar/>
        <Banner />
        <OurSolutions />
        <OurServices />
        <TeamMembers />
        <ContactForm />
        <Footer />
      </Layout>
  )
}

export default Home
