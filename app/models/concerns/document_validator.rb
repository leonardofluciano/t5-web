class DocumentValidator < ActiveModel::EachValidator
    def validate_each record, attribute, value
        if (!(self.validateCnpj value))
            record.errors.add attribute, 'must be a valid document number'
        end
    end

    private

    def validateCnpj cnpj
        cnpjArray = cnpj.split ''

        digitSum1 = 0
        cnpjArray.slice(0, 12).reverse().each_with_index do |item, index|
            digitSum1 += item.to_i * ((index.to_i % 8) + 2)
        end

        if (11 - (digitSum1 % 11) != cnpjArray[12].to_i)
            return false
        end

        digitSum2 = 0
        cnpjArray.slice(0, 13).reverse().each_with_index do |item, index|
            digitSum2 += item.to_i * ((index.to_i % 8) + 2)
        end

        if (11 - (digitSum2 % 11) != cnpjArray[13].to_i)
            return false
        end

        return true
    end
end