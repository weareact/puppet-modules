class act_tv {
	
	include ::wso2am

	$wso2am_path = "${wso2base::install_dir}/${product_name}-${product_version}"
	$repository_path = "${wso2am_path}/repository"

	$lib_path = "${repository_path}/components/lib"
	$jwt_jar = "${lib_path}/ACTJWTGenerator.jar"

	file { 'jwt_generator':
		path	=>	$jwt_jar,
		source	=>  'puppet:///modules/act_tv/ACTJWTGenerator.jar',
		owner   =>  'wso2user',
		group	=>	'wso2',
		require =>  Class['wso2am']
	}

	$security_path = "${repository_path}/resources/security"
	$actdev_jks = "${security_path}/actdev.jks"

	file { 'jks':
		path	=>	$actdev_jks,
		source	=>  'puppet:///modules/act_tv/actdev.jks',
		owner   =>  'wso2user',
		group	=>	'wso2',
		require =>  Class['wso2am']
	}

	$conf_path = "${repository_path}/conf"
	$claim_config = "${conf_path}/claim-config.xml"

	file { 'claim-config':
		path	=>	$claim_config,
		source	=>  'puppet:///modules/act_tv/claim-config.xml',
		owner   =>  'wso2user',
		group	=>	'wso2',
		require =>  Class['wso2am']
	}

}

