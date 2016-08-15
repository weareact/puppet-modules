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

	$actdev_trust = "${security_path}/client-truststore.jks"

	file { 'trust-store':
		path	=>	$actdev_trust,
		source	=>  'puppet:///modules/act_tv/client-truststore.jks',
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

	$database_path = "${repository_path}/database"
	$h2 = "${database_path}/weareact_com.h2.db"

	file { 'secondary-user-h2':
		path	=>	$h2,
		source	=>  'puppet:///modules/act_tv/weareact_com.h2.db',
		owner   =>  'wso2user',
		group	=>	'wso2',
		require =>  Class['wso2am']
	}

	$h2_trace = "${database_path}/weareact_com.trace.db"

	file { 'secondary-user-h2-trace':
		path	=>	$h2_trace,
		source	=>  'puppet:///modules/act_tv/weareact_com.trace.db',
		owner   =>  'wso2user',
		group	=>	'wso2',
		require =>  Class['wso2am']
	}

}

