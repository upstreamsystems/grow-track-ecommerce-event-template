___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Grow - Track Ecommerce Event",
  "categories": ["ATTRIBUTION", "MARKETING", "PERSONALIZATION", "REMARKETING", "CONVERSIONS"],
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Grow e-commerce event tracker for add-to-cart and order-placed events. \nSelect the appropriate \u0027event to track\u0027 value.\nTo track both events create two separate tags using this template.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "event",
    "displayName": "Event to track",
    "selectItems": [
      {
        "value": "addToCart",
        "displayValue": "Add to Cart"
      },
      {
        "value": "orderPlaced",
        "displayValue": "Order placed"
      }
    ],
    "simpleValueType": true,
    "alwaysInSummary": true
  },
  {
    "type": "GROUP",
    "name": "Order parameters",
    "displayName": "Order attributes",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "phone",
        "displayName": "Order phone",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Set the data layer variable where the phone number used in the order is stored. If you do not have one you can create one using the Grow - Order Phone variable template."
      },
      {
        "type": "TEXT",
        "name": "totalPrice",
        "displayName": "Order total price",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Set the data layer variable where the total price of the order is stored. If you do not have one you can create one using the Grow - Order Total price variable template."
      },
      {
        "type": "TEXT",
        "name": "currency",
        "displayName": "Order currency",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Set the data layer variable where the currency of the order is stored . If you do not have one you can create one using the Grow - Order Currency variable template."
      },
      {
        "type": "TEXT",
        "name": "orderID",
        "displayName": "Order ID",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Set the data layer variable where the order ID is stored. If you do not have one you can create one using the Grow - Order ID variable template."
      },
      {
        "type": "TEXT",
        "name": "coupon",
        "displayName": "Order coupon",
        "simpleValueType": true,
        "help": "Set the data layer variable where the coupon used in the order is stored. If you do not have one you can create one using the Grow - Order Coupon variable template."
      },
      {
        "type": "TEXT",
        "name": "createdAt",
        "displayName": "Order date",
        "simpleValueType": true,
        "help": "Set the data layer variable where the creation date (ISO format) of the order is stored. If you do not have one you can create one using the Grow - Order CreatedAt variable template."
      },
      {
        "type": "TEXT",
        "name": "customerID",
        "displayName": "Order customer ID",
        "simpleValueType": true,
        "help": "Set the data layer variable where the customer ID of the order is stored. If you do not have one you can create one using the Grow - Order Customer ID variable template."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "event",
        "paramValue": "orderPlaced",
        "type": "EQUALS"
      }
    ],
    "help": "Map order attributes to data layer parameters"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//const log = require('logToConsole');
const callInWindow = require('callInWindow');
const copyFromWindow = require('copyFromWindow');
const initializeUgr = require('createArgumentsQueue');

function handleAddToCart () {
  callInWindow('ugr', 'event', 'addToCart', {});
}

function handleOrderPlaced () {
  const orderPayload = {
    createdAt: data.createdAt,
    coupon: data.coupon,
    currency:  data.currency,
    customerID: data.customerID,
    orderID: data.orderID,
    phone: data.phone,
    totalPrice: data.totalPrice
  };
  callInWindow('ugr', 'event', 'order', orderPayload);
}

let ugr = copyFromWindow('ugr');
if (ugr === undefined) ugr = initializeUgr('ugr', 'ugr.q');

const event = data.event;

switch (event) {
  case 'addToCart':
    handleAddToCart();
    break;
  case 'orderPlaced':
    handleOrderPlaced();
    break;
}

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ugr.q"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ugr"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 12/04/2024, 17:11:02


