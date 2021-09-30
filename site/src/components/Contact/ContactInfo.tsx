import React from 'react'
import { useIntl } from "react-intl"

const ContactInfo = () => {
    const intl = useIntl()
    return (
        <div className="contact-info-area pt-100 pb-70">
            <div className="container">
                <div className="row">
                    <div className="col-lg-4 col-md-6">
                        <div className="contact-info-box">
                            <div className="back-icon">
                                <i className='bx bx-map'></i>
                            </div>
                            <div className="icon">
                                <i className='bx bx-map'></i>
                            </div>
                            <h3>{intl.formatMessage({ id: "address" })}{" "}</h3>
                            <p>{intl.formatMessage({ id: "addresslocation" })}{" "} {intl.formatMessage({ id: "addresscountry" })}{" "}</p>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6">
                        <div className="contact-info-box">
                            <div className="back-icon">
                                <i className='bx bx-phone-call'></i>
                            </div>
                            <div className="icon">
                                <i className='bx bx-phone-call'></i>
                            </div>
                            <h3>{intl.formatMessage({ id: "contact" })}{" "}</h3>
                            <p>{intl.formatMessage({ id: "mobile" })}{" "}<a href="tel:+44457895789">(+216) 55 767 884</a></p>
                            <p>{intl.formatMessage({ id: "email" })}{" "}<a href="mailto:hello@rewy.com">hello@ipalm.com</a></p>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6 offset-lg-0 offset-md-3">
                        <div className="contact-info-box">
                            <div className="back-icon">
                                <i className='bx bx-time-five'></i>
                            </div>
                            <div className="icon">
                                <i className='bx bx-time-five'></i>
                            </div>
                            <h3>{intl.formatMessage({ id: "hours" })}{" "}</h3>
                            <p>{intl.formatMessage({ id: "weekdays" })}{" "}</p>
                            <p>{intl.formatMessage({ id: "weekend" })}{" "}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default ContactInfo