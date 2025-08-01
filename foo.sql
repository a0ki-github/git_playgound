CREATE EXTERNAL TABLE `waf_logs`(
  `timestamp` bigint,
  `formatversion` int,
  `webaclid` string,
  `terminatingruleid` string,
  `terminatingruletype` string,
  `action` string,
  `terminatingrulematchdetails` array <
                                    struct <
                                        conditiontype: string,
                                        sensitivitylevel: string,
                                        location: string,
                                        matcheddata: array < string >
                                          >
                                     >,
  `httpsourcename` string,
  `httpsourceid` string,
  `rulegrouplist` array <
                      struct <
                          rulegroupid: string,
                          terminatingrule: struct <
                                              ruleid: string,
                                              action: string,
                                              rulematchdetails: array <
                                                                   struct <
                                                                       conditiontype: string,
                                                                       sensitivitylevel: string,
                                                                       location: string,
                                                                       matcheddata: array < string >
                                                                          >
                                                                    >
                                                >,
                          nonterminatingmatchingrules: array <
                                                              struct <
                                                                  ruleid: string,
                                                                  action: string,
                                                                  overriddenaction: string,
                                                                  rulematchdetails: array <
                                                                                       struct <
                                                                                           conditiontype: string,
                                                                                           sensitivitylevel: string,
                                                                                           location: string,
                                                                                           matcheddata: array < string >
                                                                                              >
                                                                   >,
                                                                  challengeresponse: struct <
                                                                            responsecode: string,
                                                                            solvetimestamp: string
                                                                              >,
                                                                  captcharesponse: struct <
                                                                            responsecode: string,
                                                                            solvetimestamp: string
                                                                              >
                                                                    >
                                                             >,
                          excludedrules: string
                            >
                       >,
`ratebasedrulelist` array <
                         struct <
                             ratebasedruleid: string,
                             limitkey: string,
                             maxrateallowed: int
                               >
                          >,
  `nonterminatingmatchingrules` array <
                                    struct <
                                        ruleid: string,
                                        action: string,
                                        rulematchdetails: array <
                                                             struct <
                                                                 conditiontype: string,
                                                                 sensitivitylevel: string,
                                                                 location: string,
                                                                 matcheddata: array < string >
                                                                    >
                                                             >,
                                        challengeresponse: struct <
                                                            responsecode: string,
                                                            solvetimestamp: string
                                                             >,
                                        captcharesponse: struct <
                                                            responsecode: string,
                                                            solvetimestamp: string
                                                             >
                                          >
                                     >,
  `requestheadersinserted` array <
                                struct <
                                    name: string,
                                    value: string
                                      >
                                 >,
  `responsecodesent` string,
  `httprequest` struct <
                    clientip: string,
                    country: string,
                    headers: array <
                                struct <
                                    name: string,
                                    value: string
                                      >
                                 >,
                    uri: string,
                    args: string,
                    httpversion: string,
                    httpmethod: string,
                    requestid: string
                      >,
  `labels` array <
               struct <
                   name: string
                     >
                >,
  `captcharesponse` struct <
                        responsecode: string,
                        solvetimestamp: string,
                        failureReason: string
                          >,
  `challengeresponse` struct <
                        responsecode: string,
                        solvetimestamp: string,
                        failureReason: string
                        >,
  `ja3Fingerprint` string,
  `oversizefields` string,
  `requestbodysize` int,
  `requestbodysizeinspectedbywaf` int
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://amzn-s3-demo-bucket/prefix/'
