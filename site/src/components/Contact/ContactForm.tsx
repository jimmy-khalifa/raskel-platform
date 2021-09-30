import React from 'react'
import starIcon from '../../assets/images/star-icon.png'
//import contact from '../../assets/images/contact.png'
import contact from '../../assets/images/raskel_contact.png'
import { useIntl } from "react-intl"

const ContactForm = () => {
    const intl = useIntl()
    return (
        <section id="contact" className="contact-area pb-100">
            <div className="container">
                <div className="section-title">
                    <span className="sub-title">
                        <img src={starIcon} alt="contact" /> 
                        {intl.formatMessage({ id: "getintouch" })}{" "}
                    </span>
                    <h2>{intl.formatMessage({ id: "readystarted" })}{" "}</h2>
                    <p>{intl.formatMessage({ id: "formmsg" })}{" "}</p>
                </div>

                <div className="row">
                    <div className="col-lg-6 col-md-12">
                        <div className="contact-image">
                            <img src={contact} alt="contact" />
                        </div>
                    </div>

                    <div className="col-lg-6 col-md-12">
                        <div className="contact-form">
                            <form id="contactForm">
                                <div className="row">
                                    <div className="col-lg-12 col-md-6">
                                        <div className="form-group">
                                            <input type="text" name="name" className="form-control" required placeholder={intl.formatMessage({ id: "formname" })} />
                                        </div>
                                    </div>

                                    <div className="col-lg-12 col-md-6">
                                        <div className="form-group">
                                            <input type="email" name="email" className="form-control" required placeholder={intl.formatMessage({ id: "formemail" })} />
                                        </div>
                                    </div>

                                    <div className="col-lg-12 col-md-12">
                                        <div className="form-group">
                                            <input type="text" name="phone_number" className="form-control" required placeholder={intl.formatMessage({ id: "formphone" })} />
                                        </div>
                                    </div>

                                    <div className="col-lg-12 col-md-12">
                                        <div className="form-group">
                                            <textarea name="message" className="form-control" cols="30" rows="6" required placeholder={intl.formatMessage({ id: "formmessage" })} />
                                        </div>
                                    </div>

                                    <div className="col-lg-12 col-md-12">
                                        <button type="submit" className="default-btn">
                                            <i className="flaticon-tick"></i> 
                                            {intl.formatMessage({ id: "formsend" })} <span></span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    )
}

export default ContactForm