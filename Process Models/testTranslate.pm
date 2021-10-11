{
    "process": {
        "sequenceFlow": [
            {
                "targetRef": "ServiceTask_3jm1ws",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_hpcpl",
                "sourceRef": "StartEvent_1ddhqcp",
                "type": "bpmn:sequenceFlow"
            },
            {
                "targetRef": "EndEvent_1ifp215",
                "businessProp": {},
                "name": "",
                "id": "SequenceFlow_e111ra",
                "sourceRef": "ServiceTask_3jm1ws",
                "type": "bpmn:sequenceFlow"
            }
        ],
        "endEvent": {
            "incoming": "SequenceFlow_e111ra",
            "businessProp": {},
            "name": "End",
            "id": "EndEvent_1ifp215",
            "type": "bpmn:endEvent"
        },
        "serviceTask": {
            "outgoing": "SequenceFlow_e111ra",
            "incoming": "SequenceFlow_hpcpl",
            "businessProp": {
                "headers": [],
                "method": "POST",
                "data-source-function-data": {
                    "values": [
                        "",
                        "{\"name\":\"execute\",\"datasourceId\":\"976ee2f3-401a-492b-8cbf-32f6a21a196b\",\"functionProperties\":{\"headers\":[],\"method\":\"POST\",\"dataType\":0,\"body\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"q\":{\"type\":\"string\"},\"target\":{\"type\":\"string\"}},\"required\":[\"q\",\"target\"]},\"parameters\":[]},\"functionUrl\":\"/\",\"baseUrl\":\"/Translate\",\"datasourceType\":4}"
                    ],
                    "options": [
                        "Select",
                        "execute"
                    ]
                },
                "placeHolderUrl": "\"{{HOST}}/rest/webservices/{{CONTEXT}}/{{APPLICATION}}/Translate/execute\"",
                "parameters-body": "{\u200b\u200b\u200b\n\"q\": review,\n\"target\": \"en\"\n}\u200b\u200b\u200b\n",
                "data-type": 0,
                "url": "https://localhost:3030/rest/webservices/context/application/Translate/execute",
                "datasourceType": 4,
                "proxy": "false",
                "port": "",
                "response": "translateresp",
                "data-source": "{\"name\":\"Translate\",\"datasourceType\":4,\"tenantId\":null,\"contextId\":null,\"applicationId\":\"fa5c4334-ed36-4edb-82eb-7bde697b3784\",\"applicationVersionId\":null,\"datasourceProperties\":null,\"id\":\"976ee2f3-401a-492b-8cbf-32f6a21a196b\",\"createdOn\":\"2021-08-20T15:50:17.508+02:00\",\"modifiedOn\":\"2021-08-20T15:50:17.508+02:00\",\"modifiedBy\":null,\"createdBy\":null,\"datasourceMeta\":null}",
                "reqType": "json",
                "host": "",
                "data-source-function": "{\"name\":\"execute\",\"datasourceId\":\"976ee2f3-401a-492b-8cbf-32f6a21a196b\",\"functionProperties\":{\"headers\":[],\"method\":\"POST\",\"dataType\":0,\"body\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"q\":{\"type\":\"string\"},\"target\":{\"type\":\"string\"}},\"required\":[\"q\",\"target\"]},\"parameters\":[]},\"functionUrl\":\"/execute\",\"baseUrl\":\"/Translate\",\"datasourceType\":4}",
                "parametersBody": [],
                "parameters": [],
                "bodyJson": "{\u200b\u200b\u200b\n\"q\": review,\n\"target\": \"en\"\n}\u200b\u200b\u200b\n"
            },
            "name": "Test Translate",
            "id": "ServiceTask_3jm1ws",
            "type": "bpmn:serviceTask",
            "events": []
        },
        "startEvent": {
            "outgoing": "SequenceFlow_hpcpl",
            "businessProp": {
                "defaultPriority": "Low",
                "due-date": false,
                "due-date-type": "Custom",
                "priority": false,
                "start-payload-variables": []
            },
            "name": "Start",
            "id": "StartEvent_1ddhqcp",
            "type": "bpmn:startEvent"
        },
        "id": "Process_orvr0f"
    },
    "BPMNDiagram": {
        "bpmnElement": "Process_orvr0f",
        "BPMNPlane": {
            "BPMNShape": [
                {
                    "bpmnElement": "EndEvent_1ifp215",
                    "Bounds": {
                        "cx": 588,
                        "cy": 230.1015625,
                        "x": 570,
                        "width": 36,
                        "y": 200.5,
                        "height": 59.203125
                    },
                    "id": "EndEvent_1ifp215_ve"
                },
                {
                    "bpmnElement": "ServiceTask_3jm1ws",
                    "Bounds": {
                        "cx": 409.99999237060547,
                        "cy": 218.50000762939453,
                        "x": 333.0199966430664,
                        "width": 153.95999145507812,
                        "y": 180.3350067138672,
                        "height": 76.33000183105469
                    },
                    "id": "ServiceTask_3jm1ws_ve"
                },
                {
                    "bpmnElement": "StartEvent_1ddhqcp",
                    "Bounds": {
                        "cx": 192,
                        "cy": 231.6015625,
                        "x": 174,
                        "width": 36,
                        "y": 202,
                        "height": 59.203125
                    },
                    "id": "StartEvent_1ddhqcp_ve"
                }
            ],
            "BPMNEdge": [
                {
                    "waypoint": [
                        {
                            "x": "210",
                            "y": "220"
                        },
                        {
                            "x": "271.5099983215332",
                            "y": "220"
                        },
                        {
                            "x": "271.5099983215332",
                            "y": "218.50000671386718"
                        },
                        {
                            "x": "333.0199966430664",
                            "y": "218.50000671386718"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_hpcpl",
                    "id": "SequenceFlow_hpcpl_ve"
                },
                {
                    "waypoint": [
                        {
                            "x": "486.97999664306644",
                            "y": "218.50000671386718"
                        },
                        {
                            "x": "570",
                            "y": "218.5"
                        }
                    ],
                    "bpmnElement": "SequenceFlow_e111ra",
                    "id": "SequenceFlow_e111ra_ve"
                }
            ]
        },
        "id": "Process_orvr0f_ve"
    },
    "collaboration": {}
}