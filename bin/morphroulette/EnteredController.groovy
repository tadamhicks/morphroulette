package morphroulette

import grails.config.Config
import grails.core.support.GrailsConfigurationAware
 
import static org.springframework.http.HttpStatus.OK

class EnteredController {

	String csvMimeType
 
    String encoding

    def index() { 
    	def entereds = Entry.list()
    	def rtn = [entereds:entereds]
        log.debug "index rtn: ${rtn}"
        return rtn
    }

    def download() {
        final String filename = 'book.csv'
        def lines = Entry.findAll().collect { [it.firstName, it.lastName, it.email].join(',') } as List<String>
 
        def outs = response.outputStream
        response.status = OK.value()
        response.contentType = "${csvMimeType};charset=${encoding}";
        response.setHeader "Content-disposition", "attachment; filename=${filename}"
 
        lines.each { String line ->
            outs << "${line}\n"
        }
 
        outs.flush()
        outs.close()
    }
 
    void setConfiguration(Config co) {
        csvMimeType = co.getProperty('grails.mime.types.csv', String, 'text/csv')
        encoding = co.getProperty('grails.converters.encoding', String, 'UTF-8')
 
    }
}
